import org.gradle.api.tasks.Exec
import org.gradle.kotlin.dsl.register
import org.gradle.api.tasks.Delete
import org.gradle.api.tasks.Copy

plugins {
	java
	id("org.springframework.boot") version "4.0.5"
	id("io.spring.dependency-management") version "1.1.7"
}

group = "goa.systems"
version = "0.0.1"

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
	commandLine("npm", "run", "dev")
}

val cleanStatic by tasks.register<Delete>("cleanStatic") {
	delete("src/main/resources/static")
}

val npmInstall by tasks.register<Exec>("npmInstall") {
  group = "prepare"
  description = "Install front end dependencies."
  dependsOn(cleanStatic)
  workingDir = file("src/main/react")
  commandLine("npm", "install")
}

val npmBuild by tasks.register<Exec>("npmBuild") {
  group = "build"
  description = "Build front end."
  dependsOn(npmInstall)
  workingDir = file("src/main/react")
  commandLine("npm", "run", "build")
}

val copyFrontend by tasks.register<Copy>("buildFrontend") {
	group = "build"
	description = "Build frontend"
	
	dependsOn(npmBuild)

	from("src/main/react/dist")
	into("src/main/resources/static")
}
