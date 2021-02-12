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

[[ "$verboseSwitch" == "true" ]] && touch "${ZDOTDIR}/bootstrap/install/verbose"
bash "${ZDOTDIR}/bootstrap/install/bootstrap.sh"
