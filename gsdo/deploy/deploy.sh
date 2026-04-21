#!/usr/bin/env bash
set -euo pipefail
APP_DIR="${HOME}/.local/programs/goasystems/reactexample"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Deploying application in \"${PWD}\". [${GITHUB_SHA}]"
ls -al "${APP_DIR}/${DISTNAME}-${VERSION}.jar"
echo "server.port=${SERVERPORT}" > "${APP_DIR}/application.properties"
PATH="${JAVA_HOME}/bin:${PATH}"
OWD="${PWD}"
cd ${APP_DIR}
java -jar "${APP_DIR}/${DISTNAME}-${VERSION}.jar" >/dev/null 2>&1 &
PID=$!
ps aux | grep java | grep react
echo "Disowning ${PID}"
disown %-
echo $PID > "${APP_DIR}/run.pid"
cd "${OWD}"