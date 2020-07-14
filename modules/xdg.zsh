# XDG_CONFIG_HOME variables
export npm_config_userconfig="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"

# XDG_CACHE_HOME variables
export CUDA_CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/nv"
export ICEAUTHORITY="${XDG_CACHE_HOME:-$HOME/.cache}/libice/ICEauthority"
export XAUTHORITY="${XDG_CACHE_HOME:-$HOME/.cache}/xorg-xauth/Xauthority"
export npm_config_cache="${XDG_CACHE_HOME:-$HOME/.cache}/npm"

# XDG_DATA_HOME variables
export GRADLE_USER_HOME="${XDG_DATA_HOME:-$HOME_ROOT/share}/gradle"
export LESSHISTFILE="${XDG_DATA_HOME:-$HOME_ROOT/share}/less/history"
export MYSQL_HISTFILE="${XDG_DATA_HOME:-$HOME_ROOT/share}/mysql/history"

