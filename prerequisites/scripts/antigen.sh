#!/bin/bash

source "$(realpath $(dirname $0))/../utils/ensure-xdg-folders-exist.sh"

installLoc="${XDG_DATA_HOME:-${HOME}/.local/share}/antigen"

echo "Installing Antigen to $installLoc"
git clone "https://github.com/zsh-users/antigen.git" "$installLoc"
