#!/usr/bin/env bash
set -euo pipefail

KEYFILE="${HOME}/.ssh/$(uuidgen)"
KHFILE="${HOME}/.ssh/$(uuidgen)"

echo "${SSH_SVCDEPLOY_HETZNER}" > "${KEYFILE}"
ssh-keyscan "${DISTSERVER}" 1> "${KHFILE}" 2> /dev/null
chmod 600 "${KEYFILE}"
ssh -i "${KEYFILE}" -o UserKnownHostsFile="${KHFILE}" -l "${DISTUSER}" "${DISTSERVER}" "date"
rm "${KHFILE}"
rm "${KEYFILE}"