#!/usr/bin/env bash

echo "Adding the AdoptOpenJDK APT Repo"
SCRIPTLOC="$(realpath $(dirname $0))"

REPO="https://adoptopenjdk.jfrog.io/adoptopenjdk"
KEYCHAIN_NAME="apt.adoptopenjdk"

# Download the apt key and install to the keychain

source "${SCRIPTLOC}/../utils/get-distro-name.sh"
DISTRO_NAME="$(getDistroName)"

if [[ "$DISTRO_NAME" == "unknown" ]]; then
    echo "lsb_release NOT FOUND!"
    echo "Cannot determine the correct Apt repository without it!"
    exit 1
fi

echo "Adding the Adoptopenjdk JFrog APT repository"
"$SCRIPTLOC"/../utils/add-an-apt-repo.sh "$REPO" \
    "$KEYCHAIN_NAME" \
    "api/gpg/key/public" \
    "${REPO}/deb/ ${DISTRO_NAME} main" \
    "adoptopenjdk"

echo "Updating the Apt Cache"
sudo apt update

JDK_VERSIONS=(adoptopenjdk-8-hotspot adoptopenjdk-8-hotspot-jre)
JDK_VERSIONS+=(adoptopenjdk-11-hotspot adoptopenjdk-11-hotspot-jre)

echo "Installing AdoptOpenJDK versions 8 and 11"
sudo apt install "${JDK_VERSIONS[@]}"
