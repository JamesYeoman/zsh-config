#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../xdg/home.sh"

installLoc="${XDG_DATA_HOME}/fzf"

git clone https://github.com/junegunn/fzf.git "${installLoc}"
"${installLoc}"/install --all --xdg
