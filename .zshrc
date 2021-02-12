zstyle ':completion:*' completer _complete _ignored

loadModule "interactive/antigen"
loadModule "interactive/completions"
loadModule "interactive/misc"
loadModule "interactive/fzf"

# Sets the window title to the current directory
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
