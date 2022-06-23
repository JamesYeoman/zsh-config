export EDITOR="nano"
export DEFAULT_USER="$(whoami)"
export ADOTDIR="${XDG_CACHE_HOME}/antigen"
export BIN_HOME="${HOME}/.local/bin"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"

[[ ! -d "$BIN_HOME" ]] && mkdir -p "$BIN_HOME"

HISTFILE="${XDG_CACHE_HOME}/zsh/history"

# Set history size to 10k lines
HISTSIZE=10000
HISTFILESIZE=$HISTSIZE

# ISO FORMAT!!!!! WOOP!!!!!
HIST_STAMPS="yyyy-mm-dd"
