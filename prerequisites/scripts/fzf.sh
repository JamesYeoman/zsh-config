#!/usr/bin/env bash

git clone https://github.com/junegunn/fzf.git "${XDG_DATA_HOME:-$HOME_ROOT/.local/share}/fzf"
"${XDG_DATA_HOME:-$HOME_ROOT/.local/share}"/fzf/install --all --xdg
