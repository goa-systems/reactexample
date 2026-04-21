#!/usr/bin/env bash
set -euo pipefail
systemctl stop goa.systems.reactexample.service
APP_DIR="${HOME}/.local/programs/goasystems/reactexample"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Deploying application in \"${PWD}\". [${GITHUB_SHA}]"
echo "server.port=${SERVERPORT}" > "${APP_DIR}/application.properties"
systemctl start goa.systems.reactexample.service