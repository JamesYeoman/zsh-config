
mkdir -p "${XDG_CONFIG_HOME}/m2" "${XDG_CACHE_HOME}/m2/repository" "${XDG_CACHE_HOME}/m2/wrapper" "${XDG_CACHE_HOME}/zsh"

ETC_ZSH_ENV="\n\nexport ZDOTDIR=\"\${XDG_CONFIG_HOME:-\$HOME/.config}/zsh\"\n"

verboseLog "Installing a ZSH Env tweak to the global zshenv file"
echo "${ETC_ZSH_ENV}" | sudo tee -a &>/dev/null

# Link files rather than copying so that pulling updates cascades to the actual locations
verboseLog "Linking files from the repo to their appropriate places"
ln -s "${ZDOTDIR}/dotfiles/settings.xml" "${XDG_CONFIG_HOME}/m2/settings.xml"

# Link XDG-compliant maven locations to the default location for compatibility with
# stubborn applications like Maven Wrapper that don't support overriding
verboseLog "Linking XDG-Compliant maven files to the default locations"
for item in "${XDG_CACHE_HOME}"/m2/* ; do
  itemname="$(basename $item)"
  ln -s "${item}" "${HOME}/.m2/${itemname}"
done

ln -s "${XDG_CONFIG_HOME}/m2/settings.xml" "${HOME}/.m2/settings.xml"

verboseLog "Since likely 99% of all scripts on your system use Bash,"
verboseLog "it's necessary to give Bash access to XDG compliance."
sudo ln -s "${ZDOTDIR}/prerequisites/profile.d/01_xdg_init.sh" "/etc/profile.d/01_xdg_init.sh"
