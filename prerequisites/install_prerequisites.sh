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

echo "Installing the Yarn package manager for node"
bash "${SCRIPTPATH}/yarn.sh"
printf "Done\n\n"

echo "Not auto-installing editors, because they're preferences."
echo "If you want to have either of the following editors installed, there are scripts provided"
printf "\tJetbrains Toolbox (for Intellij IDEA)\n"
printf "\tVS Code\n\n"
