zstyle ':completion:*' completer _complete _ignored

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fallback to the powerlevel9k config if powerlevel10k hasn't been configured
[[ -f "${ZDOTDIR}/.p10k.zsh"  ]] || source "${ZDOTDIR}/powerlevel9kconfig.zsh"

loadModule "interactive/antigen"
loadModule "interactive/completions"
loadModule "interactive/misc"
loadModule "interactive/fzf"
loadModule "interactive/user_defs"

# Sets the window title to the current directory
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac


[[ -f "${ZDOTDIR}/.p10k.zsh" ]] && source "${ZDOTDIR}/.p10k.zsh"

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
