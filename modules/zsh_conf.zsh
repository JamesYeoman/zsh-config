#This is to allow the themes to be able to display the correct name in the prompt
export DEFAULT_USER="$(whoami)"

# ISO FORMAT!!!!! WOOP!!!!!
export HIST_STAMPS="yyyy-mm-dd"

# Just as a nice addition. Personal taste and all that
export COMPLETION_WAITING_DOTS="true"

# The default size of the history file is so damn small. Let's fix that
export HISTSIZE=100000
export HISTFILESIZE=100000

# Sets the window to just the current directory
export DISABLE_AUTO_TITLE="true"
