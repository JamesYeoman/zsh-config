#!/usr/bin/env bash

echo "Ensuring Ubuntu-maintained docker isn't installed"
sudo apt-get remove docker docker-engine docker.io containerd runc \
    && echo "success" \
    || echo "An error occured. It's probably just that there were packages that weren't installed"

SCRIPTLOC="$(realpath $(dirname $0))"

REPO="https://download.docker.com/linux/ubuntu"
KEYCHAIN_NAME="apt.docker"

source "${SCRIPTLOC}/../utils/get-distro-name.sh"
DISTRO_NAME="$(getDistroName)"

if [[ "${DISTRO_NAME}" == "unknown" ]]; then
    echo "lsb_release NOT FOUND!"
    echo "Cannot determine the correct Apt repository without it!"
    exit 1
fi

# Download the apt key and install to the keychain
pushd "${SCRIPTLOC}/../utils"
./add-an-apt-repo.sh "${REPO}" \
                     "${KEYCHAIN_NAME}" \
                     "gpg" \
                     "${REPO} ${DISTRO_NAME} stable" \
                     "docker" \
                     "arch=amd64"
popd

echo "Installing Docker"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
