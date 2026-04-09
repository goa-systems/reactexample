#!/usr/bin/env bash
set -euo pipefail
BASE_DIR="${HOME}/.local/programs/node"
NODE_PACKAGE=node-v${NODEVERSION}-linux-x64
APP_DIR="${BASE_DIR}/${NODE_PACKAGE}"
if [ ! -d "${APP_DIR}" ]
then
    wget -O "${HOME}/node.tar.gz" -q "https://nodejs.org/dist/v${NODEVERSION}/${NODE_PACKAGE}.tar.gz"
    tar -x -f "${HOME}/node.tar.gz" -C "${BASE_DIR}"
    rm "${HOME}/node.tar.gz"
else
    echo "NodeJS already installed."
fi

echo "NODE_HOME=${APP_DIR}" >> $GITHUB_ENV