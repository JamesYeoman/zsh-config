#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../xdg/home.sh"

URL='https://data.services.jetbrains.com/products/download?platform=linux&code=TBA'
curl -fsSL $URL | tar -zxv --strip-components 1 --transform="s/jetbrains-toolbox*/jetbrains-toolbox/g"
installationLoc="${XDG_DATA_HOME}/JetBrains/Toolbox"

cat > "${XDG_CONFIG_HOME}/autostart/jetbrains-toolbox.desktop" << EOF
[Desktop Entry]
Exec=${installationLoc}/bin/jetbrains-toolbox --minimize
Icon=${installationLoc}/toolbox.svg
MimeType=x-scheme-handler/jetbrains;
Name=JetBrains Toolbox
StartupNotify=false
StartupWMClass=jetbrains-toolbox
Terminal=false
Type=Application
Version=1.0
X-GNOME-Autostart-Delay=10
X-GNOME-Autostart-enabled=true
X-KDE-autostart-after=panel
X-MATE-Autostart-Delay=10
EOF

# This should download Jetbrains Toolbox to the ~/.local/share/Jetbrains/Toolbox folder
# If not, this script will need rethinking
./jetbrains-toolbox
