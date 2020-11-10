#!/usr/bin/env bash

YARN_URL="https://dl.yarnpkg.com/debian"

curl -fsSL "${YARN_URL}/pubkey.gpg" | sudo apt-key add -
sudo add-apt-repository "deb ${YARN_URL}/ stable main"
sudo apt update -qq && sudo apt install --no-install-recommends yarn
