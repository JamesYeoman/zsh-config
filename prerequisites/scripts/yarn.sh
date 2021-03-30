#!/usr/bin/env bash

SCRIPTLOC="$(realpath $(dirname $0))"

REPO="https://dl.yarnpkg.com/debian"
KEYCHAIN_NAME="apt.yarn"

# Download the apt key and install to the keychain
pushd "${SCRIPTLOC}/../utils"
./add-an-apt-repo.sh "${REPO}" \
                     "${KEYCHAIN_NAME}" \
                     "pubkey.gpg" \
                     "${REPO}/ stable main" \
                     "yarn"
popd

sudo apt update -qq && sudo apt install --no-install-recommends yarn
