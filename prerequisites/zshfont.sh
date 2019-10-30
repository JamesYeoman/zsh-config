#!/bin/bash

INST_TMP="${HOME}/install-temp"

mkdir -p "${INST_TMP}"
wget -q -O "${INST_TMP}/DroidSansMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/DroidSansMono.zip"
mkdir -p "${INST_TMP}/termfont"
unzip -q "${INST_TMP}/DroidSansMono.zip" -d "${INST_TMP}/termfont"

echo "Copying the new fonts to /usr/share/fonts/opentype"
sudo -k cp "${INST_TMP}/termfont/Droid Sans Mono Nerd Font Complete Mono.otf" "/usr/share/fonts/opentype/DroidSansMonoNerdFontCompleteMono.otf"
sudo -k cp "${INST_TMP}/termfont/Droid Sans Mono Nerd Font Complete.otf" "/usr/share/fonts/opentype/DroidSansMonoNerdFontComplete.otf"

echo "Copying is now done! Refreshing the Font Cache"
sudo fc-cache -f -v &>/dev/null 

echo "Font Installation complete!"

