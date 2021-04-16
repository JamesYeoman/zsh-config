#region XDG Home Variables initialisation
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
export npm_config_userconfig="${XDG_CONFIG_HOME}/npm/npmrc"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"

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

#endregion
