export CLOUDSDK_HOME="/usr/lib/google-cloud-sdk"
export ADOTDIR="${XDG_CACHE_HOME:-$HOME/.cache}/antigen"
export HOME_ROOT="${HOME}/.local"
export EDITOR="nano"
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Makes ZSH append to the history file rather than making a new one each time
setopt inc_append_history

# Shares the ZSH History across sessions
setopt share_history

# When cycling through the history, any duplicates will be filtered out
setopt HIST_FIND_NO_DUPS