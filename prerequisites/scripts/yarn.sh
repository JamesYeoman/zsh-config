#!/usr/bin/env bash

curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://dl.yarnpkg.com/debian/ stable main"
sudo apt update -qq && sudo apt install --no-install-recommends yarn
