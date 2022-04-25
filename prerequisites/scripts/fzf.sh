#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../utils/ensure-xdg-folders-exist.sh"

installLoc="${XDG_DATA_HOME:-${HOME}/.local/share}/fzf"

echo "Installing FZF to $installLoc"
git clone "https://github.com/junegunn/fzf.git" "$installLoc"
"$installLoc"/install --all --xdg
