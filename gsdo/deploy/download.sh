#!/usr/bin/env bash
set -euo pipefail

KEYFILE="${HOME}/.ssh/$(uuidgen)"
KHFILE="${HOME}/.ssh/$(uuidgen)"

echo "${SSH_SVCDEPLOY_HETZNER}" > "${KEYFILE}"
ssh-keyscan "${DISTSERVER}" 1> "${KHFILE}" 2> /dev/null
chmod 600 "${KEYFILE}"
scp -i "${KEYFILE}" -o UserKnownHostsFile="${KHFILE}" "${DISTUSER}":"${DISTSERVER}":"${DISTNAME}-${VERSION}.jar" "${DISTNAME}-${VERSION}.jar"
rm "${KHFILE}"
rm "${KEYFILE}"