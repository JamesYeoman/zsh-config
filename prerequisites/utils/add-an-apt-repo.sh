#!/usr/bin/env bash

ROOT="$(realpath $(dirname $0))"

REPO="$1"
KEYCHAIN_NAME="$2"
KEYFILE="$3"
SOURCELINE="$4"
SOURCEFILE="/etc/apt/sources.list.d/${5}.list"
shift 5
SRC_LINE_OPTS="$@"

echo "Repository URL: $REPO"
echo "Keychain GPG Key: ${KEYCHAIN_NAME}.gpg"
echo "Source Line: $SOURCELINE"
echo "Source File: $SOURCEFILE"
echo "Adding an APT Repository..."

FULL_SRCLINE="deb [signed-by=/usr/share/keyrings/${KEYCHAIN_NAME}.gpg ${SRC_LINE_OPTS}] $SOURCELINE"

echo "$FULL_SRCLINE" | sudo tee "$SOURCEFILE" >/dev/null

# Download the apt key and install to the keychain
"$ROOT"/keychain.sh "${REPO}/$KEYFILE" "$KEYCHAIN_NAME"
