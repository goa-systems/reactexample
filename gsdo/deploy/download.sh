#!/usr/bin/env bash
set -euo pipefail

# Define "scp -4" (IPv4) as alias for "scp". Required for this project.
alias scp="scp -4"

KEYFILE="${HOME}/.ssh/$(uuidgen)"
KHFILE="${HOME}/.ssh/$(uuidgen)"

echo "${SSH_SVCDEPLOY_HETZNER}" > "${KEYFILE}"
ssh-keyscan -4 "${DISTSERVER}" 1> "${KHFILE}" 2> /dev/null
chmod 600 "${KEYFILE}"
scp -i "${KEYFILE}" -o UserKnownHostsFile="${KHFILE}" "${DISTUSER}"@"${DISTSERVER}":"${DISTNAME}-${VERSION}.jar" "${HOME}/${DISTNAME}-${VERSION}.jar"
rm "${KHFILE}"
rm "${KEYFILE}"