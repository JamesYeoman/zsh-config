#!/usr/bin/env bash

installLoc="${XDG_DATA_HOME:-$HOME_ROOT/.local/share}/fzf"

git clone https://github.com/junegunn/fzf.git "${installLoc}"
"${installLoc}"/install --all --xdg
