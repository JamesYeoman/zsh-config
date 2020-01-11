#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )/prerequisites"

echo "Installing base dependencies"
bash "${SCRIPTPATH}/deps.sh"
printf "Done\n\n"

echo "Installing Antigen to /usr/local/share/antigen"
bash "${SCRIPTPATH}/antigen.sh"
printf "Done\n\n"

echo "Installing a font that has the required glyphs"
bash "${SCRIPTPATH}/zshfont.sh"
echo "Done"
