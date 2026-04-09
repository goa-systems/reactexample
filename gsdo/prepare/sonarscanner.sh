#!/usr/bin/env bash

BASE_DIR="${HOME}/.local/programs/sonarqube"
DIRNAME=sonar-scanner-${SONARVERSION}-linux-x64
PACKAGE=sonar-scanner-cli-${SONARVERSION}-linux-x64
APP_DIR="${BASE_DIR}/${DIRNAME}"
if [ ! -d "${BASE_DIR}" ]; then mkdir -p "$BASE_DIR"; fi
if [ ! -d "${APP_DIR}" ]
then
    wget -O "${HOME}/sonarqube.zip" -q "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${PACKAGE}.zip"
    unzip -q "${HOME}/sonarqube.zip" -d "${BASE_DIR}"
    rm "${HOME}/sonarqube.zip"
else
    echo "Sonar scanner already installed."
fi

echo "SONAR_HOME=${APP_DIR}" >> $GITHUB_ENV