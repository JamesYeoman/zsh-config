source "${INSTALLER_ROOT}/utils/ensure-xdg-folders-exist.sh"

installLoc="${XDG_DATA_HOME:-${HOME}/.local/share}/antidote"

echo "Installing Antidote to $installLoc"
git clone --depth=1 https://github.com/mattmc3/antidote.git "$installLoc"
