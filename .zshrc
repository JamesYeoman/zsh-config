zstyle ':completion:*' completer _complete _ignored

# Fallback to the powerlevel9k config if powerlevel10k hasn't been configured
if [[ ! -f "${USER_DEFS}/p10k.zsh" ]]; then
  if [[ "${P9K_SUPPRESS_WARNING:-0}" == 0 ]]; then
    echo "No Powerlevel10k config specified. Defaulting to the Powerlevel9k config."
    echo "Run 'p10k configure' to generate your config"
    printf "(and then move the generated file to user_defs/p10k.zsh).\n\n"
    echo "Add 'export P9K_SUPPRESS_WARNING=1' to user_defs/interactive.zsh in order to suppress this message."
  fi

  source "${ZDOTDIR}/p9k.zsh"
fi

# I'm not sure what (%) is meant to expand out to, but the default value of %n is equivalent to defaulting to $USERNAME
# (see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Login-information)
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

loadModule "interactive/antigen"
loadModule "interactive/completions"
loadModule "interactive/misc"
loadModule "interactive/fzf"
sourceIfExists "${USER_DEFS}/interactive.zsh"

# Sets the window title to the current directory (not sure how this works or where I got it from...)
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac


sourceIfExists "${USER_DEFS}/p10k.zsh"

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
