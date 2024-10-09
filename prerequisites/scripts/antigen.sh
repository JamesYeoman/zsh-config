#!/bin/bash

source "$(realpath $(dirname $0))/../utils/ensure-xdg-folders-exist.sh"

git clone https://github.com/zsh-users/antigen.git "${XDG_DATA_HOME:-${HOME}/.local/share}/antigen"
