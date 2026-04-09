#!/usr/bin/env bash

BASE_DIR="${HOME}/.local/programs/gradle"
DIRNAME=gradle-${GRADLEVERSION}
PACKAGE=${DIRNAME}-bin
APP_DIR="${BASE_DIR}/${DIRNAME}"
if [ ! -d "${BASE_DIR}" ]; then mkdir -p "$BASE_DIR"; fi
if [ ! -d "${APP_DIR}" ]
then
    GRADLE_ARCH_TEMP="/tmp/$(uuidgen).zip"
    wget -O "${GRADLE_ARCH_TEMP}" -q "https://downloads.gradle.org/distributions/${PACKAGE}.zip"
    echo "Gradle downloaded to ${GRADLE_ARCH_TEMP}. Extracting."
    unzip -q "${GRADLE_ARCH_TEMP}" -d "${BASE_DIR}"
    rm "${GRADLE_ARCH_TEMP}"
else
    echo "Gradle already installed."
fi

echo "GRADLE_HOME=${APP_DIR}" >> $GITHUB_ENV