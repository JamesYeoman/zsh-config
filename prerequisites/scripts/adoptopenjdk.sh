#!/usr/bin/env bash

echo "Adding the AdoptOpenJDK APT Repo"
SCRIPTLOC="$(realpath $(dirname $0))"

REPO="https://adoptopenjdk.jfrog.io/adoptopenjdk"
KEYCHAIN_NAME="apt.adoptopenjdk"

# Download the apt key and install to the keychain
pushd "${SCRIPTLOC}/../utils"
./add-an-apt-repo.sh "${REPO}" \
                     "${KEYCHAIN_NAME}" \
                     "api/gpg/key/public" \
                     "${REPO}/deb/ $(lsb_release -cs) main" \
                     "adoptopenjdk"
popd

echo "Updating the Apt Cache"
sudo apt update

JDK_VERSIONS=(adoptopenjdk-8-hotspot adoptopenjdk-8-hotspot-jre)
JDK_VERSIONS+=(adoptopenjdk-11-hotspot adoptopenjdk-11-hotspot-jre)

echo "Installing the AdoptOpenJDK versions"
sudo apt install "${JDK_VERSIONS[@]}"
