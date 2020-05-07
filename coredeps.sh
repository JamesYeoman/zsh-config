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

echo "Ensuring base ubuntu deps are installed"
sudo apt -qqy install "${toInstall[@]}"

echo "Installing the ubuntu-recommended drivers"
sudo ubuntu-drivers autoinstall

echo "Installing config"
mkdir -p "${HOME}/.config" # Ensure the config directory exists
export ZDOTDIR="${HOME}/.config/zsh"
git clone "https://github.com/JamesYeoman/zsh-config.git" "${ZDOTDIR}"
cp "${ZDOTDIR}/dotfiles/.zshenv" "${HOME}/.zshenv"
bash "${ZDOTDIR}/prerequisites/copy-to-profile-d.sh"
mkdir -p "${HOME}/.config/m2"
cp "${ZDOTDIR}/dotfiles/settings.xml" "${HOME}/.config/m2/settings.xml"
bash "${ZDOTDIR}/prerequisites/install_prerequisites.sh"
echo "Please restart your machine in order to ensure the zshenv file gets loaded properly (because I don't know exactly the load rules for the zshenv file, but rebooting makes sure it gets loaded"
