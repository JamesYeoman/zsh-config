#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../xdg/home.sh"

echo "Adding the Racket APT Repository"
sudo add-apt-repository --yes ppa:plt/racket

echo "Updating the APT Cache"
sudo apt update

echo "Installing Racket"
sudo apt install -qqy racket

echo "Adding a custom Gnome Menu file so that XDG Compliance is session-wide"

COMMENT="DrRacket is an interactive, integrated, graphical programming environment for the Racket programming languages."
EXEC="env PLTUSERHOME=${XDG_DATA_HOME}/racket drracket -singleInstance %F"

cat > "${XDG_CONFIG_HOME}/applications/drracket.desktop" << EOF
[Desktop Entry]
Name=DrRacket
GenericName=IDE for Racket
Comment=$COMMENT
Terminal=false
Type=Application
Categories=Development;Education;
Exec=$EXEC
Icon=racket-logo
StartupNotify=true
MimeType=text/x-scheme;
EOF
