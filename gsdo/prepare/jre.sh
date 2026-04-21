#!/usr/bin/env bash
set -euo pipefail
APP_DIR="${HOME}/.local/programs/java"
if [ ! -d "${APP_DIR}" ]; then mkdir -p "$APP_DIR"; fi
JAVA_PACKAGE=zulu${ZULUVERSION}-ca-fx-jre${JAVAVERSION}-linux_x64
if [ ! -d "${APP_DIR}" ]
then
    PKG="/tmp/$(uuidgen).tar.gz"
    wget -4 -O "${PKG}" -q "https://cdn.azul.com/zulu/bin/${JAVA_PACKAGE}.tar.gz"
    tar -x -f "${PKG}" -C "${APP_DIR}"
    rm "${PKG}"
else
    echo "Java already installed."
fi

echo "JAVA_HOME=${APP_DIR}" >> $GITHUB_ENV