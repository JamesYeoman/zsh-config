datahome="${HOME}/.local/share"
cachehome="${HOME}/.cache"
confighome="${HOME}/.config"

if [ -z "${XDG_DATA_HOME}" ]; then
  export XDG_DATA_HOME="${datahome}"
fi

if [ -z "${XDG_CACHE_HOME}" ]; then
  export XDG_CACHE_HOME="${cachehome}"
fi

if [ -z "${XDG_CONFIG_HOME}" ]; then
  export XDG_CONFIG_HOME="${confighome}"
fi

