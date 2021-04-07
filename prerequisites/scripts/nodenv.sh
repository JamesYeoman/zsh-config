#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../xdg/home.sh"

GROUP_URL="https://github.com/nodenv"
INST="${XDG_DATA_HOME}/nodenv"

git clone "${GROUP_URL}/nodenv.git" ${INST}

mkdir ${INST}/plugins
git clone "${GROUP_URL}/node-build.git" ${INST}/plugins/node-build
