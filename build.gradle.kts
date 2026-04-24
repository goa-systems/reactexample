import org.apache.tools.ant.taskdefs.condition.Os

plugins {
  java
  id("org.springframework.boot") version "4.0.6"
  id("io.spring.dependency-management") version "1.1.7"
}

group = "goa.systems"
version = "0.0.1"

/* Specify the npm command to be used. */
var npmcmd: String
if (Os.isFamily(Os.FAMILY_WINDOWS)) { npmcmd = "npm.cmd" } else { npmcmd = "npm" }

java {
  sourceCompatibility = JavaVersion.VERSION_21
  targetCompatibility = JavaVersion.VERSION_21
}

repositories {
  mavenCentral()
}

dependencies {
  implementation("org.springframework.boot:spring-boot-starter-webmvc")
  implementation("org.springframework.boot:spring-boot-starter-webservices")
  developmentOnly("org.springframework.boot:spring-boot-devtools")
  testImplementation("org.springframework.boot:spring-boot-starter-webmvc-test")
  testImplementation("org.springframework.boot:spring-boot-starter-webservices-test")
  testRuntimeOnly("org.junit.platform:junit-platform-launcher")
}

tasks.withType<Test> {
  useJUnitPlatform()
}

tasks.register<Exec>("reactRun") {
  group = "build"
  description = "Runs the React dev server (npm run dev)"
  workingDir = file("src/main/react")
  commandLine(npmcmd, "run", "dev")
}

val cleanReact by tasks.register<Delete>("cleanReact") {
  group = "build"
  description = "Cleans the folder 'static'."
  delete("src/main/resources/static")
  delete("src/main/react/dist")
  delete("src/main/react/node_modules")
}

val npmInstall by tasks.register<Exec>("npmInstall") {
  group = "prepare"
  description = "Install front end dependencies."
  workingDir = file("src/main/react")
  commandLine(npmcmd, "install")
}

val npmBuild by tasks.register<Exec>("npmBuild") {
  group = "build"
  description = "Build front end."
  dependsOn(npmInstall)
  workingDir = file("src/main/react")
  commandLine(npmcmd, "run", "build")
}

val integrateFrontend by tasks.register<Copy>("integrateFrontend") {
  group = "build"
  description = "Build frontend"
  dependsOn(npmBuild)
  from("src/main/react/dist")
  into("src/main/resources/static")
}

tasks.processResources {
  dependsOn(integrateFrontend)
}
