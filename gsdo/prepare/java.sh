#!/usr/bin/env bash

APP_DIR="${HOME}/.local/programs/java"
JAVA_PACKAGE=zulu${ZULUVERSION}-ca-fx-jdk${JAVAVERSION}-linux_x64
APP_DIR="${APP_DIR}/${JAVA_PACKAGE}"
if [ ! -d "${APP_DIR}" ]
then
    mkdir -p "$APP_DIR"
    wget -O "${HOME}/java.tar.gz" -q "https://cdn.azul.com/zulu/bin/${JAVA_PACKAGE}.tar.gz"
    tar -x -f "${HOME}/java.tar.gz" -C "${APP_DIR}"
    rm "${HOME}/java.tar.gz"
else
    echo "Java already installed."
fi

echo "JAVA_HOME=${APP_DIR}" >> $GITHUB_ENV