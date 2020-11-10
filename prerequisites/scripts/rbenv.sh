#!/usr/bin/env bash

GROUP_URL="https://github.com/rbenv"
installloc="${XDG_DATA_HOME:-$HOME/.local/share}/rbenv"
TO_INSTALL=("autoconf" "bison" "build-essential")
TO_INSTALL+=("libssl-dev" "libyaml-dev" "libreadline6-dev")
TO_INSTALL+=("zlib1g-dev" "libncurses5-dev" "libffi-dev" "libgdbm6" "libgdbm-dev" "libdb-dev")

echo "Installing rbenv"
git clone "${GROUP_URL}/rbenv.git" "${installloc}"

echo "Installing rbenv required packages"
sudo apt-get install -qqy "${TO_INSTALL[@]}"

echo "Installing ruby-build"
mkdir -p "${installloc}/plugins"
git clone "${GROUP_URL}/ruby-build.git" "${installloc}/plugins/ruby-build"
