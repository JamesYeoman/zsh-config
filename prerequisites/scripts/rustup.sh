#!/usr/bin/env bash

# Installs Rustup in an xdg-compliant fashion

source "$(realpath $(dirname $0))/../utils/ensure-variables-exist.sh"

export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path
