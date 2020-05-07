#!/usr/bin/env bash

echo "Ensuring Ubuntu-maintained docker isn't installed"
sudo apt-get remove docker docker-engine docker.io containerd runc && echo "success" || echo "An error occured. It's probably just that there were packages that weren't installed"

echo "Adding Docker's GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Adding the Docker PPA"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -qq

echo "Installing Docker"
sudo apt install docker-ce docker-ce-cli containerd.io

