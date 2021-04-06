#!/usr/bin/env bash
verboseSwitch="$1"
verboseSwitch="$([[ "$verboseSwitch" == "-v" ]] && echo "true" || echo "false")"
verboseLog() { [[ "$verboseSwitch" == "true" ]] && echo "$1" }

if ! command -v apt-get &>/dev/null; then
  echo "Not a debian-based system, not supported."
  echo "You'll have to tinker a bit in order to get this installation to work for you."
  echo "Read this script and translate it to the equivilent for your distro or OS"
  exit 1
fi

echo "Checking sudo privilages"
sudo echo "Successful" || (echo "Insufficient privilages" && exit 1)

verboseLog "Installing git"
sudo apt-get install -qq git

export ZDOTDIR="${xdg_config}/zsh"
git clone "https://github.com/JamesYeoman/zsh-config.git" "${ZDOTDIR}"

# Ensure defaults are set
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

source "${ZDOTDIR}/bootstrap/install/update.sh"
source "${ZDOTDIR}/bootstrap/config.sh"

bash "${ZDOTDIR}/prerequisites/install_prerequisites.sh"
echo "Please restart your machine in order to ensure the zshenv file gets loaded properly"
echo "(because I don't know exactly the load rules for the zshenv file, but rebooting makes sure it gets loaded)"
