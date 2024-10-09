#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../utils/ensure-xdg-folders-exist.sh"

GROUP_URL="https://github.com/nodenv"
export NODENV_ROOT="${XDG_DATA_HOME:-${HOME}/.local/share}/nodenv"

git clone "${GROUP_URL}/nodenv.git" "$NODENV_ROOT"
export PATH="${NODENV_ROOT}/bin:$PATH"

mkdir "${NODENV_ROOT}/plugins"
git clone "${GROUP_URL}/node-build.git" "${NODENV_ROOT}/plugins/node-build"

eval "$(nodenv init -)"
