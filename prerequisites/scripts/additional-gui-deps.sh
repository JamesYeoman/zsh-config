#!/usr/bin/env bash

toInstall=(
    "compiz"
    "mesa-utils"
    "mesa-utils-extra"
    "xwayland"
    "wayland-protocols"
    "gnome-session-wayland"
)

sudo apt install -qqy "${toInstall[@]}"
