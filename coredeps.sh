#!/usr/bin/env bash
verboseSwitch="$1"
verboseLog() { [[ "$verboseSwitch" ]] && echo "$1" }

if ! command -v apt-get &>/dev/null; then
  echo "Not a debian-based system, not supported."
  echo "You'll have to tinker a bit in order to get this installation to work for you."
  echo "Read this script and translate it to the equivilent for your distro or OS"
fi

verboseLog "Ensuring everything is up to date"
sudo apt-get update -qq && sudo apt-get upgrade -qqy

toInstall=(
    "git" "curl" "build-essential" "apt-transport-https" "ca-certificates"
    "gnupg-agent" "software-properties-common" "xclip"
)

verboseLog "Ensuring base debian deps are installed"
sudo apt-get -qqy install "${toInstall[@]}"

verboseLog "Installing config"
xdg_cache="${XDG_CACHE_HOME:-$HOME/.cache}"
xdg_config="${XDG_CONFIG_HOME:-$HOME/.config}"

# Create needed directories
mkdir -p "${xdg_config}/m2" "${HOME}/.m2" "${xdg_cache}/m2/repository"

export ZDOTDIR="${xdg_config}/zsh"
git clone "https://github.com/JamesYeoman/zsh-config.git" "${ZDOTDIR}"

# Link files rather than copying so that pulling updates cascades to the actual locations
verboseLog "Linking files from the repo to their appropriate places"
ln -s "${ZDOTDIR}/dotfiles/.zshenv" "${HOME}/.zshenv"
ln -s "${ZDOTDIR}/dotfiles/settings.xml" "${xdg_config}/m2/settings.xml"

# Link XDG-compliant maven locations to the default location for compatibility with applications like Maven Wrapper that don't support overriding
verboseLog "Linking XDG-Compliant maven files to the default locations"
ln -s "${xdg_cache}/m2/repository" "${HOME}/.m2/repository"
ln -s "${xdg_config}/m2/settings.xml" "${HOME}/.m2/settings.xml"

bash "${ZDOTDIR}/prerequisites/install_prerequisites.sh"
echo "Please restart your machine in order to ensure the zshenv file gets loaded properly (because I don't know exactly the load rules for the zshenv file, but rebooting makes sure it gets loaded"
