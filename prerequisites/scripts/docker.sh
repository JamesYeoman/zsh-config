#!/usr/bin/env bash

APT_URL="https://download.docker.com/linux/ubuntu"

echo "Ensuring Ubuntu-maintained docker isn't installed"
sudo apt-get remove docker docker-engine docker.io containerd runc \
    && echo "success" \
    || echo "An error occured. It's probably just that there were packages that weren't installed"

echo "Adding Docker's GPG Key"
curl -fsSL "${APT_URL}/gpg" | sudo apt-key add -

echo "Adding the Docker PPA"
sudo add-apt-repository "deb [arch=amd64] ${APT_URL} $(lsb_release -cs) stable"
sudo apt update -qq

echo "Installing Docker"
sudo apt install docker-ce docker-ce-cli containerd.io

