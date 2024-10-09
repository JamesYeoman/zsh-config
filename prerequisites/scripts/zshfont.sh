#!/bin/bash

sudo wget -qO \
    "/usr/share/fonts/opentype/DroidSansMonoNerdFontCompleteMono.otf" \
    "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf?raw=true"

echo "Download is now done! Refreshing the Font Cache"
sudo fc-cache -f -v &>/dev/null

echo "Remember to set your terminal font to one of the DroidSansMono Nerdfont Mono variants."
sleep 3s # This is to give the user time to actually see the above message

echo "Font Installation complete!"
