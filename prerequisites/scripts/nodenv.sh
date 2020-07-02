#!/usr/bin/env bash

INST="${HOME}/.local/share/nodenv"
git clone https://github.com/nodenv/nodenv.git ${INST}

mkdir ${INST}/plugins
git clone https://github.com/nodenv/node-build.git ${INST}/plugins/node-build
