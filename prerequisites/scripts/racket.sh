#!/usr/bin/env bash

ROOT="$(realpath $(dirname $0))"
source "${ROOT}/../utils/ensure-xdg-folders-exist.sh"

echo "Adding the Racket APT Repository"
sudo add-apt-repository --yes ppa:plt/racket

echo "Updating the APT Cache"
sudo apt update

echo "Installing Racket"
sudo apt install -qqy racket


echo "Adding a custom Gnome Menu file so that XDG Compliance is session-wide"

CFG_XDG="${XDG_CONFIG_HOME:-${HOME}/.config}"
DATA_XDG="${XDG_DATA_HOME:-${HOME}/.local/share}"

COMMENT="DrRacket is an interactive, integrated, graphical programming environment for the Racket programming languages."
EXEC="env PLTUSERHOME=${DATA_XDG}/racket drracket -singleInstance %F"

if [[ -z "${DATA_XDG}/racket" ]]; then
    mkdir "${DATA_XDG}/racket"
fi

if [[ -z "${CFG_XDG}/applications" ]]; then
    mkdir "${CFG_XDG}/applications"
fi

# Touching the desktop file before writing in order to avoid "file doesn't exist" error messages
touch "${CFG_XDG}/applications/drracket.desktop"
cat "${ROOT}/../utils/drracket.template.desktop" \
| sed "s:{{COMMENTLINE}}:Comment=$COMMENT:" \
| sed "s:{{EXECLINE}}:Exec=$EXEC:" > "${CFG_XDG}/applications/drracket.desktop"
