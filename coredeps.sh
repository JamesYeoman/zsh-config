#!/usr/bin/env bash

echo "Adding the graphics drivers repository"
sudo add-apt-repository -y ppa:graphics-drivers

echo "Upgrading"
sudo apt-get update -qq && sudo apt-get upgrade -qqy

toInstall=(
    "git"
    "build-essential"
    "apt-transport-https"
    "ca-certificates"
    "curl"
    "gnupg-agent"
    "software-properties-common"
    "xclip"
)

if [[ "$1" -eq "include-gui-deps" ]]; then
    toInstall+=(
        "compiz"
        "mesa-utils"
        "mesa-utils-extra"
        "xwayland"
        "wayland-protocols"
        "gnome-session-wayland"
    )
fi

echo "Ensuring base ubuntu deps are installed"
sudo apt -qqy install "${toInstall[@]}"

echo "Installing the ubuntu-recommended drivers"
sudo ubuntu-drivers autoinstall

echo "Installing config"
mkdir -p "${HOME}/.config" # Ensure the config directory exists
zsh_conf="${HOME}/.config/zsh"
git clone "https://github.com/JamesYeoman/zsh-config.git" "${zsh_conf}"
cp "${zsh_conf}/dotfiles/.zshrc" "${HOME}/.zshrc"
mkdir -p "${HOME}/.local/etc/m2"
cp "${zsh_conf}/dotfiles/settings.xml" "${HOME}/.local/etc/m2/settings.xml"
bash "${zsh_conf}/prerequisites/install_prerequisites.sh"
