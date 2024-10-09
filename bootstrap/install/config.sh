# Ensure the config directories exist
mkdir -p "${XDG_CONFIG_HOME}/m2" "${XDG_CONFIG_HOME}/vim"

# Ensure the cache directories exist
mkdir -p "${XDG_CACHE_HOME}/m2/repository" "${XDG_CACHE_HOME}/m2/wrapper" "${XDG_CACHE_HOME}/zsh"

# Stubborn maven wrapper...
mkdir -p "${HOME}/.m2"

ETC_ZSH_ENV="
export ZDOTDIR=\"\${XDG_CONFIG_HOME:-\$HOME/.config}/zsh\"
source /etc/commonprofile
"

# TODO: conditionally append, in order to support config version migration
verboseLog "Installing a ZSH Env tweak to the global zshenv file"
echo "${ETC_ZSH_ENV}" | sudo tee -a /etc/zsh/zshenv &>/dev/null

verboseLog "Since likely 99% of all scripts on your system use Bash,"
verboseLog "it's necessary to give Bash access to XDG compliance."
echo "source /etc/commonprofile" | sudo tee /etc/profile.d/01_common_shell_config.sh &>/dev/null

verboseLog "Now it's time to link some files."

verboseLog "Linking the common/commonprofile.sh to /etc/commonprofile"
sudo ln -s "${ZDOTDIR}/common/commonprofile.sh" "/etc/commonprofile"

# Link files rather than copying so that pulling updates cascades to the actual locations
verboseLog "Linking files from the repo to their appropriate places"
ln -s "${ZDOTDIR}/dotfiles/settings.xml" "${XDG_CONFIG_HOME}/m2/settings.xml"
ln -s "${ZDOTDIR}/dotfiles/xdgrc.vim" "${XDG_CONFIG_HOME}/vim/xdgrc.vim"

# Link XDG-compliant maven locations to the default location for compatibility with
# stubborn applications like Maven Wrapper that don't support overriding
verboseLog "Linking XDG-Compliant maven files to the default locations"
for item in "${XDG_CACHE_HOME}"/m2/*; do
  itemname="$(basename $item)"
  ln -s "$item" "${HOME}/.m2/$itemname"
done

ln -s "${XDG_CONFIG_HOME}/m2/settings.xml" "${HOME}/.m2/settings.xml"
