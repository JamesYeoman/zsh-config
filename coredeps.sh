#!/usr/bin/env bash

echo "Adding the graphics drivers repository"
sudo add-apt-repository -y ppa:graphics-drivers

echo "Upgrading"
sudo apt-get update -qq && sudo apt-get upgrade -qqy

echo "Ensuring base ubuntu deps are installed"
sudo apt -qqy install git build-essential apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo "Installing the ubuntu-recommended drivers"
sudo ubuntu-drivers autoinstall

echo "Installing config"
mkdir -p "${HOME}/.config" # Ensure the config directory exists
zsh_conf="${HOME}/.config/zsh"
git clone "https://github.com/JamesYeoman/zsh-config.git" "${zsh_conf}"
cp "${zsh_conf}/dotfiles/.zshrc" "${HOME}/.zshrc"
bash "${zsh_conf}/prerequisites/install_prerequisites.sh"
