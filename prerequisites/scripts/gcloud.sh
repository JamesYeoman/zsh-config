#!/usr/bin/env bash

curl "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo apt-key --keyring "/usr/share/keyrings/cloud.google.gpg" add -
sudo add-apt-repository "deb http://packages.cloud.google.com/apt cloud-sdk main"
sudo apt update -qq
sudo apt install -qqy google-cloud-sdk
