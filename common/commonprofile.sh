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
# XDG_CACHE_HOME variable isn't going to cut it...
if [[ "${XDG_CONFIG_HOME:-unset}" == "unset" ]]; then
    export XDG_CONFIG_HOME="${HOME}/.config"
fi

if [[ "${XDG_CACHE_HOME:-unset}" == "unset" ]]; then
    export XDG_CACHE_HOME="${HOME}/.cache"
fi

if [[ "${XDG_DATA_HOME:-unset}" == "unset" ]]; then
    export XDG_DATA_HOME="${HOME}/.local/share"
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
export TERMINFO="${XDG_DATA_HOME}/terminfo"
export TERMINFO_DIRS="${XDG_DATA_HOME}/terminfo:/usr/share/terminfo"
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"
#endregion
