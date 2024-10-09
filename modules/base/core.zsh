export EDITOR="nano"
export DEFAULT_USER="$(whoami)"
export ADOTDIR="${XDG_CACHE_HOME}/antigen"
export BIN_HOME="${HOME}/.local/bin"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"

[[ ! -d "$BIN_HOME" ]] && mkdir -p "$BIN_HOME"
