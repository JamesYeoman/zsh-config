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

export ZDOTDIR="/opt/zshconf"
sudo git clone "https://github.com/JamesYeoman/zsh-config.git" "$ZDOTDIR"
sudo chmod -R 755 "$ZDOTDIR"

sudo chmod 777 "${ZDOTDIR}/user"
user_conf_loc="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh"
if [[ ! -d "$user_conf_loc" ]]; then
  mkdir -p "$user_conf_loc"
fi

ln -s "$user_conf_loc" "${ZDOTDIR}/user/$USER"
chmod -R 700 "${ZDOTDIR}/user/$USER"

echo "Symlinked \$XDG_CONFIG_HOME/zsh to \$ZDOTDIR/user/\$USER"
echo "Put any config overrides in \$XDG_CONFIG_HOME/zsh (if XDG_CONFIG_HOME wasn't set, this has defaulted to \$HOME/.config/zsh."
echo "Only you can read, write, and execute stuff in that folder."

sudo chmod 777 "${ZDOTDIR}/completions"
mkdir "${ZDOTDIR}/completions/$USER"
chmod 700 "${ZDOTDIR}/completions/$USER"

echo "Created \$ZDOTDIR/completions/\$USER."
echo "Place any custom completion scripts into that folder. Only you can read, write, and execute stuff in that folder."

source "${ZDOTDIR}/common/commonprofile.sh"
source "${ZDOTDIR}/bootstrap/install/update.sh"
source "${ZDOTDIR}/bootstrap/install/config.sh"

bash "${ZDOTDIR}/prerequisites/installer.sh" -m "zshfont"

echo "Not choosing a zsh plugin manager for you. Choose between Antigen and ZI."
echo "Use ${ZDOTDIR}/prerequisites/installer.sh to install any additional tools (e.g. a plugin manager)."
echo ""
echo "Remember to run \$(chsh -s /bin/zsh) if you want to set ZSH as your default shell."
echo "Also remember to log out and back in if you change your default shell."
