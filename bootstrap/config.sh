#!/usr/bin/env bash
FOLDER="${dirname $0}"
verboseLog() {bash -c "${FOLDER}/verboseLog.sh \"$1\""}

verboseLog "Installing config"
xdg_cache="${XDG_CACHE_HOME:-$HOME/.cache}"
xdg_config="${XDG_CONFIG_HOME:-$HOME/.config}"

# Create needed directories
mkdir -p "${xdg_config}/m2" "${xdg_cache}/m2/repository"

export ZDOTDIR="${xdg_config}/zsh"
ETC_ZSH_ENV="$(cat /etc/zsh/zshenv)\n\nexport ZDOTDIR=\"\${XDG_CONFIG_HOME:-\$HOME/.config}/zsh\"\n"
sudo cat > /etc/zsh/zshenv <<< "${ETC_ZSH_ENV}"

# Link files rather than copying so that pulling updates cascades to the actual locations
verboseLog "Linking files from the repo to their appropriate places"
ln -s "${ZDOTDIR}/dotfiles/.zshenv" "${HOME}/.zshenv"
ln -s "${ZDOTDIR}/dotfiles/settings.xml" "${xdg_config}/m2/settings.xml"

# Link XDG-compliant maven locations to the default location for compatibility with applications like Maven Wrapper that don't support overriding
verboseLog "Linking XDG-Compliant maven files to the default locations"
for item in "${xdg_cache}"/m2/* ; do
  itemname="$(basename $item)"
  ln -s "${item}" "${HOME}/.m2/${itemname}"
done

ln -s "${xdg_config}/m2/settings.xml" "${HOME}/.m2/settings.xml"
