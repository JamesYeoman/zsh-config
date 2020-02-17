#!/bin/bash

sudo wget -q -O \
"/usr/share/fonts/opentype/DroidSansMonoNerdFontCompleteMono.otf" \
"https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf?raw=true"

echo "Download is now done! Refreshing the Font Cache"
sudo fc-cache -f -v &>/dev/null 

echo "Font Installation complete!"

