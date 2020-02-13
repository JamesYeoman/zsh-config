#!/bin/bash

SCRIPTPATH="$( realpath "$(dirname "$0")" )"

echo "Installing Docker"
bash "${SCRIPTPATH}/docker.sh"

echo "Installing ZSH"
sudo apt install -qqy zsh
printf "Done\n\n"

echo "Installing Antigen to /usr/local/share/antigen"
bash "${SCRIPTPATH}/antigen.sh"
printf "Done\n\n"

echo "Installing a font that has the required glyphs for the zsh theme"
bash "${SCRIPTPATH}/zshfont.sh"
echo "Done"
