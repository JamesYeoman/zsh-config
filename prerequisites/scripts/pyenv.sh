#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../utils/ensure-variables-exist.sh"

git clone https://github.com/pyenv/pyenv.git "${XDG_DATA_HOME}/pyenv"
