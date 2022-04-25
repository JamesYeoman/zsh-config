#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../utils/ensure-xdg-folders-exist.sh"

GROUP_URL="https://github.com/rbenv"
export RBENV_ROOT="${XDG_DATA_HOME:-${HOME}/.local/share}/rbenv"

TO_INSTALL=("autoconf" "bison" "build-essential")
TO_INSTALL+=("libssl-dev" "libyaml-dev" "libreadline6-dev")
TO_INSTALL+=("zlib1g-dev" "libncurses5-dev" "libffi-dev" "libgdbm6" "libgdbm-dev" "libdb-dev")

echo "Installing rbenv required packages"
sudo apt-get install -qqy "${TO_INSTALL[@]}"

echo "Installing rbenv"
git clone "${GROUP_URL}/rbenv.git" "$RBENV_ROOT"

export PATH="${RBENV_ROOT}/bin:$PATH"

echo "Installing ruby-build"
mkdir -p "${RBENV_ROOT}/plugins"
git clone "${GROUP_URL}/ruby-build.git" "${RBENV_ROOT}/plugins/ruby-build"

echo "Starting up rbenv in this shell"
eval "$(rbenv init -)"
