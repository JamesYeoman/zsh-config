#!/bin/bash

SCRIPTPATH="$(realpath "$(dirname "$0")")/scripts"

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
printf "Done\n\n"

echo "Installing AdoptOpenJDK versions of the JDK"
bash "${SCRIPTPATH}/adoptopenjdk.sh"
printf "Done\n\n"

echo "Installing the various 'env's"
bash "${SCRIPTPATH}/jenv.sh"
bash "${SCRIPTPATH}/nodenv.sh"
bash "${SCRIPTPATH}/pyenv.sh"
printf "Done\n\n"

echo "Not auto-installing Jetbrains Toolbox. If you want it installed, there's a script provided to install it"
