#!/bin/bash

DEST="/usr/share/fonts/opentype/DroidSansMonoNerdFontCompleteMono.otf"
URL="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf?raw=true"
sudo -k wget -q -O $DEST $URL

echo "Download is now done! Refreshing the Font Cache"
sudo fc-cache -f -v &>/dev/null 

echo "Font Installation complete!"

