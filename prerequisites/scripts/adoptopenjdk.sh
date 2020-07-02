#!/usr/bin/env bash

echo "Adding the AdoptOpenJDK GPG Key"
curl -fsSL https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -

echo "Adding the AdoptOpenJDK Repository"
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/

echo "Updating the Apt Cache"
sudo apt update

JDK_VERSIONS=(adoptopenjdk-11-hotspot adoptopenjdk-11-hotspot-jre)
JDK_VERSIONS+=(adoptopenjdk-12-hotspot adoptopenjdk-12-hotspot-jre)
JDK_VERSIONS+=(adoptopenjdk-13-hotspot adoptopenjdk-13-hotspot-jre)

echo "Installing the AdoptOpenJDK versions"
sudo apt install "${JDK_VERSIONS[@]}"