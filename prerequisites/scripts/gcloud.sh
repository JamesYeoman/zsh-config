#!/usr/bin/env bash

GOOGLE_APT="https://packages.cloud.google.com/apt"
APT_SOURCE_FILE="/etc/apt/sources.list.d/google-cloud-sdk.list"

echo "deb ${GOOGLE_APT} cloud-sdk main" | sudo tee -a "${APT_SOURCE_FILE}"
curl -fsSL "${GOOGLE_APT}/doc/apt-key.gpg" | sudo apt-key add -

sudo apt update -qq
sudo apt install -qqy google-cloud-sdk
