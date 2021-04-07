#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../xdg/home.sh"

git clone https://github.com/pyenv/pyenv.git "${XDG_DATA_HOME}/pyenv"
