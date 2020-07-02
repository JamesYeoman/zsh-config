zstyle ':completion:*' completer _complete _ignored
export CLOUDSDK_HOME="/usr/lib/google-cloud-sdk"
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"
export EDITOR=vim
export ZMODDIR="${ZDOTDIR}/modules"

sourceIfExists() {
    [[ -e "$1" ]] && source "$1"
}

sourceIfExists "${ZMODDIR}/antigen.zsh"
sourceIfExists "${ZMODDIR}/exports.zsh"
sourceIfExists "${ZMODDIR}/opts.zsh"
sourceIfExists "${ZMODDIR}/functions.zsh"
sourceIfExists "${ZMODDIR}/envs.zsh"

for file in "${ZMODDIR}/aliases"/*; do
  source "$file"
done

sourceIfExists "${ZMODDIR}/xdg.zsh"
sourceIfExists "${ZMODDIR}/completions.zsh"

# fzf is Fuzzy Find tool https://github.com/junegunn/fzf
sourceIfExists "${XDG_DATA_HOME}/fzf/fzf.zsh"

# Sets the window title to the current directory
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
