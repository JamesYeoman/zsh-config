#!/usr/bin/env bash

# https://t-5.eu/hp/Home/
# Contains some great linux audio tools
# (like the parametric equalizer that this script installs)

SCRIPTLOC="$(realpath $(dirname $0))"

REPO="https://t-5.eu/debian"
KEYCHAIN_NAME="apt.t5.eu"

# Download the apt key and install to the keychain
pushd "${SCRIPTLOC}/../utils"
./add-an-apt-repo.sh "${REPO}" \
    "${KEYCHAIN_NAME}" \
    "pubkey.txt" \
    "${REPO}/ repo main" \
    "t5.eu"
popd

sudo apt update -qq
sudo apt install pulseaudio-parametric-eq

echo "Remember to try and find your headphones in https://github.com/jaakkopasanen/AutoEq/tree/master/results/rtings"
