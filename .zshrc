zstyle ':completion:*' completer _complete _ignored
export CLOUDSDK_HOME="/usr/lib/google-cloud-sdk"
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"
export EDITOR=vim

sourceIfExists() {
    [[ -e "$1" ]] && source "$1"
}

sourceIfExists "${ZDOTDIR}/antigen.zsh"
sourceIfExists "${ZDOTDIR}/exports.zsh"
sourceIfExists "${ZDOTDIR}/opts.zsh"
sourceIfExists "${ZDOTDIR}/functions.zsh"
sourceIfExists "${ZDOTDIR}/envs.zsh"
sourceIfExists "${ZDOTDIR}/aliases.zsh"
sourceIfExists "${ZDOTDIR}/xdg.zsh"
sourceIfExists "${ZDOTDIR}/completions.zsh"

# fzf is Fuzzy Find tool https://github.com/junegunn/fzf
sourceIfExists "${PERSONAL_ETC}/fzf/fzf.zsh"

# Sets the window title to the current directory
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
