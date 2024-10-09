export EDITOR="nano"
export DEFAULT_USER="$(whoami)"
export ADOTDIR="${XDG_CACHE_HOME}/antigen"
export BIN_HOME="${HOME}/.local/bin"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"

[[ ! -d "$BIN_HOME" ]] && mkdir -p "$BIN_HOME"


# Set history size to 10k lines
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export SAVEHIST=$HISTSIZE

export HISTFILE="${XDG_CACHE_HOME}/zsh/history"

# ISO FORMAT!!!!! WOOP!!!!!
export HIST_STAMPS="yyyy-mm-dd"
