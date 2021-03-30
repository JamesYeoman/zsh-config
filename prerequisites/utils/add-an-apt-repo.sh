#!/usr/bin/env bash

REPO="$1"
KEYCHAIN_NAME="$2"
KEYFILE="$3"
SOURCELINE="$4"
SOURCEFILE="$5"
shift 5
SRC_LINE_OPTS="$@"


FULL_SRCLINE="deb [signed-by=/usr/share/keyrings/${KEYCHAIN_NAME}.gpg ${SRC_LINE_OPTS}] ${SOURCELINE}"

echo "${FULL_SRCLINE}" | sudo tee "/etc/apt/sources.list.d/${SOURCEFILE}.list" > /dev/null

# Download the apt key and install to the keychain
./keychain.sh "${REPO}/${KEYFILE}" "${KEYCHAIN_NAME}"
