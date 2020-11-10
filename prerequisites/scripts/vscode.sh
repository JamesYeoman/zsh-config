#!/usr/bin/env bash

MS_URL="https://packages.microsoft.com"

curl -fsSL "${MS_URL}/keys/microsoft.asc" | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] ${MS_URL}/repos/vscode stable main"
sudo apt update -qq && sudo apt install -qqy code
