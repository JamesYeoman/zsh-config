# Allows for overriding of the XDG variables, and any other pre-setup you want
if [[ -f "${ZDOTDIR}/user/$USER/common.sh" ]]; then
  source "${ZDOTDIR}/user/$USER/common.sh"
fi

#region XDG Home Variables initialisation

# Rather than just falling back, this needs to be done.
# Some programs are violators of the spec, like Nvidia.
#
# The arch wiki states the following
# "Uses XDG_CACHE_HOME if set, otherwise improperly
# falls back to ~/.nv instead of ~/.cache."
#
# If a multi-million corporation can't understand a
# specification correctly, then just setting the
# XDG_CACHE_HOME variable isn't going to cut it.
# Trust is lost. This is blastphemy, but necessary.
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="${HOME}/.config"
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME="${HOME}/.cache"
fi

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="${HOME}/.local/share"
fi

if [[ -z "$XDG_STATE_HOME" ]]; then
  export XDG_STATE_HOME="${HOME}/.local/state"
fi
#endregion

#region Environment Variables for XDG Compliance

# XDG_CONFIG_HOME variables

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export GTK_RC_FILES="${XDG_CONFIG_HOME}/gtk-1.0/gtkrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java"

VIMINIT_XDG="set nocp | source ${XDG_CONFIG_HOME}/vim/xdgrc.vim"
export VIMINIT="${VIMINIT_XDG} | source ${XDG_CONFIG_HOME}/vim/vimrc"
export GVIMINIT="${VIMINIT_XDG} | source ${XDG_CONFIG_HOME}/vim/gvimrc"
unset VIMINIT_XDG

# XDG_CACHE_HOME variables
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export npm_config_cache="${XDG_CACHE_HOME}/npm"
export SONAR_USER_HOME="${XDG_CACHE_HOME}/sonar"
export SONARLINT_USER_HOME="${XDG_CACHE_HOME}/sonarlint"

# XDG_DATA_HOME variables
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export LESSKEY="${XDG_DATA_HOME}/less/keys"
export LESSHISTFILE="${XDG_DATA_HOME}/less/history"
export MYSQL_HISTFILE="${XDG_DATA_HOME}/mysql/history"
export MACHINE_STORAGE_PATH="${XDG_DATA_HOME}/docker-machine"
export PLTUSERHOME="${XDG_DATA_HOME}/racket"
export GOPATH="${XDG_DATA_HOME}/go"
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"

#endregion

#region XDG Compliance aliases

alias tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf"

#endregion

#region Histfile setup

if [[ -n "$ZSH_VERSION" ]]; then
  PROFILE_SHELL=zsh
elif [[ -n "$BASH_VERSION" ]]; then
  PROFILE_SHELL=bash
fi

if [[ -n "$PROFILE_SHELL" ]]; then
  export HISTFILE="${XDG_DATA_HOME}/${PROFILE_SHELL}/history"
fi

#endregion

#region linuxbrew

# For when you don't have access to sudo
if [[ -d "${HOME}/.linuxbrew" ]]; then
  # No XDG support unfortunately...
  eval "$(~/.linuxbrew/bin/brew shellenv)"
fi

if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

#endregion

#region misc

if [[ -z "$APPIMAGE_ROOT" ]]; then
  export APPIMAGE_ROOT="/opt/appimages"
  export APPIMAGE_BIN="${APPIMAGE_ROOT}/$USER"
fi

if [[ -d "$APPIMAGE_BIN" ]]; then
  appimg_bin_stat="$(stat -c '%a' $APPIMAGE_BIN)"
  if [[ "$appimg_bin_stat" != *"754" ]]; then
    echo "${APPIMAGE_BIN} has incorrect permissions!"
    echo "Expected permissions *754, found $appimg_bin_stat"
  fi
else
  echo "${APPIMAGE_BIN} does not exist! Please create it, take ownership of it, and give it 754 permissions"
fi

#endregion
