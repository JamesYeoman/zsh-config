# Set history size to 10k lines
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export SAVEHIST=$HISTSIZE

export HISTFILE="${XDG_CACHE_HOME}/zsh/history"

# ISO FORMAT!!!!! WOOP!!!!!
export HIST_STAMPS="yyyy-mm-dd"

# Makes ZSH append to the history file rather than making a new one each time
setopt INC_APPEND_HISTORY

# Shares the ZSH History across sessions
setopt SHARE_HISTORY

# When cycling through the history, any duplicates will be filtered out
# but duplicates will be retained in the histfile
setopt HIST_FIND_NO_DUPS

# Write the history file in the ":start:elapsed;command" format.
setopt EXTENDED_HISTORY
