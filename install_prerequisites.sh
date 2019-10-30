#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

echo "Installing Antigen to /usr/local/share/antigen"
bash "${SCRIPTPATH}/antigen.sh"
printf "Done\n\n"

echo "Installing a font that has the required glyphs"
bash "${SCRIPTPATH}/zshfont.sh"
echo "Done"
