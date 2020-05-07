#!/usr/bin/env bash

mkdir -p ${HOME}/.local/bin
URL='https://data.services.jetbrains.com/products/download?platform=linux&code=TBA'
curl -fsSL $URL | tar -zxv --strip-components 1 --transform="s/jetbrains-toolbox*/jetbrains-toolbox/g"

cat > "${HOME}/.config/autostart/jetbrains-toolbox.desktop" << EOF
[Desktop Entry]
Exec=${HOME}/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize
Icon=${HOME}/.local/share/JetBrains/Toolbox/toolbox.svg
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
