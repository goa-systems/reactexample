#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${HOME}/.local/programs/goasystems/reactexample"
if [ ! -d "${APP_DIR}" ]; then mkdir -p "${APP_DIR}"; fi

KEYFILE="${HOME}/.ssh/$(uuidgen)"
KHFILE="${HOME}/.ssh/$(uuidgen)"

echo "${SSH_SVCDEPLOY_HETZNER}" > "${KEYFILE}"
ssh-keyscan -4 "${DISTSERVER}" 1> "${KHFILE}" 2> /dev/null
chmod 600 "${KEYFILE}"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Starting download."
scp -4 -i "${KEYFILE}" -o UserKnownHostsFile="${KHFILE}" "${DISTUSER}"@"${DISTSERVER}":"${DISTNAME}-${VERSION}.jar" "${APP_DIR}/${DISTNAME}-${VERSION}.jar"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Download finished."
rm "${KHFILE}"
rm "${KEYFILE}"