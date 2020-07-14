conf_home="${XDG_CONFIG_HOME:-$HOME/.config}"
cache_home="${XDG_CACHE_HOME:-$HOME/.cache}"
data_home="${XDG_DATA_HOME:-$HOME_ROOT/share}"

# XDG_CONFIG_HOME variables
export npm_config_userconfig="${conf_home}/npm/npmrc"

# XDG_CACHE_HOME variables
export CUDA_CACHE_PATH="${cache_home}/nv"
export ICEAUTHORITY="${cache_home}/libice/ICEauthority"
export XAUTHORITY="${cache_home}/xorg-xauth/Xauthority"
export npm_config_cache="${cache_home}/npm"
export SONAR_USER_HOME="${cache_home}/sonar"
export SONARLINT_USER_HOME="${cache_home}/sonarlint"

# XDG_DATA_HOME variables
export GRADLE_USER_HOME="${data_home}/gradle"
export LESSHISTFILE="${data_home}/less/history"
export MYSQL_HISTFILE="${data_home}/mysql/history"
