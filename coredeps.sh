#!/usr/bin/env bash
verboseSwitch="$1"
verboseLog() { [[ "$verboseSwitch" ]] && echo "$1" }

verboseLog "Adding the graphics drivers repository"
sudo add-apt-repository -y ppa:graphics-drivers

verboseLog "Upgrading"
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

verboseLog "Ensuring base ubuntu deps are installed"
sudo apt -qqy install "${toInstall[@]}"

verboseLog "Installing the ubuntu-recommended drivers"
sudo ubuntu-drivers autoinstall

verboseLog "Installing config"

# Create needed directories
mkdir -p "${HOME}/.config/m2" "${HOME}/.m2" "${HOME}/.cache/m2/repository"

export ZDOTDIR="${HOME}/.config/zsh"
git clone "https://github.com/JamesYeoman/zsh-config.git" "${ZDOTDIR}"
bash "${ZDOTDIR}/prerequisites/copy-to-profile-d.sh"

# Link files rather than copying so that pulling updates cascades to the actual locations
verboseLog "Linking files from the repo to their appropriate places"
ln -s "${ZDOTDIR}/dotfiles/.zshenv" "${HOME}/.zshenv"
ln -s "${ZDOTDIR}/dotfiles/settings.xml" "${HOME}/.config/m2/settings.xml"

# Link XDG-compliant maven locations to the default location for compatibility with applications like Maven Wrapper that don't support overriding
verboseLog "Linking XDG-Compliant maven files to the default locations"
ln -s "${HOME}/.cache/m2/repository" "${HOME}/m2/repository"
ln -s "${HOME}/.config/m2/settings.xml" "${HOME}/m2/settings.xml"

bash "${ZDOTDIR}/prerequisites/install_prerequisites.sh"
echo "Please restart your machine in order to ensure the zshenv file gets loaded properly (because I don't know exactly the load rules for the zshenv file, but rebooting makes sure it gets loaded"
