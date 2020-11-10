#!/usr/bin/env bash

GROUP_URL="https://github.com/nodenv"
INST="${XDG_DATA_HOME:-$HOME/.local.share}/nodenv"

git clone "${GROUP_URL}/nodenv.git" ${INST}

mkdir ${INST}/plugins
git clone "${GROUP_URL}/node-build.git" ${INST}/plugins/node-build
