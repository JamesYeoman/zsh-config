#!/usr/bin/env bash

SCRIPTLOC="$(realpath $(dirname $0))"

REPO="https://packages.cloud.google.com/apt"
KEYCHAIN_NAME="apt.google.cloud"

# Download the apt key and install to the keychain
pushd "${SCRIPTLOC}/../utils"
./add-an-apt-repo.sh "${REPO}" \
                     "${KEYCHAIN_NAME}" \
                     "doc/apt-key.gpg" \
                     "${REPO} cloud-sdk main" \
                     "google-cloud-sdk"
popd

sudo apt update -qq
sudo apt install -qqy google-cloud-sdk
