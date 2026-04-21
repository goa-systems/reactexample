#!/usr/bin/env bash
set -euo pipefail
APP_DIR="${HOME}/.local/programs/goasystems/reactexample"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Deploying application in \"${PWD}\". [${GITHUB_SHA}]"
ls -al "${APP_DIR}/${DISTNAME}-${VERSION}.jar"
"${JAVA_HOME}/bin/java" --version