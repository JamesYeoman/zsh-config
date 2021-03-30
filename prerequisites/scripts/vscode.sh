#!/usr/bin/env bash

REPO="https://packages.microsoft.com"
KEYCHAIN_NAME="apt.microsoft"

# Download the apt key and install to the keychain
pushd "${SCRIPTLOC}/../utils"
./add-an-apt-repo.sh "${REPO}" \
                     "${KEYCHAIN_NAME}" \
                     "keys/microsoft.asc" \
                     "[arch=amd64] ${REPO}/repos/vscode stable main" \
                     "vscode"
popd

sudo apt update -qq && sudo apt install -qqy code
