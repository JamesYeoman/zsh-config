if [[ "${XDG_CONFIG_HOME:-unset}" -eq "unset" ]]; then
    export XDG_CONFIG_HOME="${HOME}/.config"
fi

if [[ "${XDG_CACHE_HOME:-unset}" -eq "unset" ]]; then
    export XDG_CACHE_HOME="${HOME}/.cache"
fi

if [[ "${XDG_DATA_HOME:-unset}" -eq "unset" ]]; then
    export XDG_DATA_HOME="${HOME}/.local/share"
fi
