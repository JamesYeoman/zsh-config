#!/usr/bin/env zsh

# The root folder of all the files that have been created
# from extracting configuration from .zshrc
export SHELL_CONF="${HOME}/.config/zsh"
[[ ! -d "${SHELL_CONF}" ]] && mkdir -p "${SHELL_CONF}"

# For files like .zcompdump and .history
export ZSH_JUNK="${HOME}/.local/etc/zsh"
[[ ! -d "${ZSH_JUNK}" ]] && mkdir -p "${ZSH_JUNK}"

# User Binaries
export MY_BIN="${HOME}/.local/bin"
[[ ! -d "${MY_BIN}" ]] && mkdir -p "${MY_BIN}"

# Maven User Folder (settings.xml and the maven repo)
export M2_HOME="${HOME}/.local/etc/m2"
[[ ! -d "${M2_HOME}" ]] && mkdir "${M2_HOME}"

# Executes the user's ZSH configuration (if it exists)
[[ -e "${SHELL_CONF}/profile.zsh" ]] && source "${SHELL_CONF}/profile.zsh"

# Makes sure the history file exists where we want it to
export HISTFILE="${ZSH_JUNK}/.history"
[[ ! -e $HISTFILE ]] && touch $HISTFILE

export COMPDUMPFILE="${ZSH_JUNK}/.zcompdump"

# The default size of the history file is so damn small. Let's fix that
export HISTSIZE=100000
export HISTFILESIZE=100000

# Just as a nice addition. Personal taste and all that
export COMPLETION_WAITING_DOTS="true"

# ISO FORMAT!!!!! WOOP!!!!!
export HIST_STAMPS="yyyy-mm-dd"

# Makes ZSH append to the history file rather than making a new one each time
setopt inc_append_history

# Shares the ZSH History across sessions
setopt share_history

# When cycling through the history, any duplicates will be filtered out
setopt HIST_FIND_NO_DUPS

# The next line updates PATH for the Google Cloud SDK.
[[ -e "${HOME}/google-cloud-sdk/path.zsh.inc" ]] && source "${HOME}/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
[[ -e "${HOME}/google-cloud-sdk/completion.zsh.inc" ]] && source "${HOME}/google-cloud-sdk/completion.zsh.inc"

# Used by the Snap Store tool
emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH

autoload -Uz compinit && compinit -d "${ZSH_JUNK}/.zcompdump"
