#!/usr/bin/env bash

verboseLog() {
  #TODO: Make pretty
  echo "$1"
}

if ! command -v apt-get &>/dev/null; then
  echo "Not a debian-based system, not supported."
  echo "You'll have to tinker a bit in order to get this installation to work for you."
  echo "Read this script and translate it to the equivilent for your distro or OS"
  exit 1
fi

echo "Checking sudo privilages"
if sudo echo "test message"; then
  echo "Successful"
else
  echo "Insufficient privilages"
  exit 1
fi

verboseLog "Installing git"
sudo apt-get install -qq git

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
git clone "https://github.com/JamesYeoman/zsh-config.git" "$ZDOTDIR"

source "${ZDOTDIR}/common/commonprofile.sh"
source "${ZDOTDIR}/bootstrap/install/update.sh"
source "${ZDOTDIR}/bootstrap/install/config.sh"

bash "${ZDOTDIR}/prerequisites/install_prerequisites.sh"
echo "Remember to run \$(chsh -s /bin/zsh) if you want to set ZSH as your default shell."
echo "Also remember to log out and back in if you change your default shell."
