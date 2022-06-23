if [[ -z "${XDG_DATA_HOME:-${HOME}/.local/share}" ]]; then
    mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}"
fi

if [[ -z "${XDG_CONFIG_HOME:-${HOME}/.config}" ]]; then
    mkdir -p "${XDG_CONFIG_HOME:-${HOME}/.config}"
fi

if [[ -z "${XDG_CACHE_HOME:-${HOME}/.cache}" ]]; then
    mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}"
fi
