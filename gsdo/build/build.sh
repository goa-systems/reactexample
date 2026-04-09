#!/usr/bin/env bash
set -euo pipefail
PATH="${JAVA_HOME}/bin:${GRADLE_HOME}/bin:${SONAR_HOME}/bin:${PATH}"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Building application in \"${PWD}\" with version \"${VERSION}\" for commit \"${GITHUB_SHA}\" and PATH \"${PATH}\"."