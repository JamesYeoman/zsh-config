zstyle ':completion:*' completer _complete _ignored

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fallback to the powerlevel9k config if powerlevel10k hasn't been configured
sourceIfNotExists "${USER_DEFS}/p10k.zsh" "${ZDOTDIR}/p9k.zsh"

loadModule "interactive/antigen"
loadModule "interactive/completions"
loadModule "interactive/misc"
loadModule "interactive/fzf"
sourceIfExists "${USER_DEFS}/interactive.zsh"

# Sets the window title to the current directory
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac


[[ -f "${USER_DEFS}/p10k.zsh" ]] && source "${USER_DEFS}/p10k.zsh"

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
