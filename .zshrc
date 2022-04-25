zstyle ':completion:*' completer _complete _ignored cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"

source "${ZDOTDIR}/bootstrap/loading.sh"

# Fallback to the powerlevel9k config if powerlevel10k hasn't been configured
if [[ ! -f "${USER_DEFS}/p10k.zsh" ]]; then
  if [[ "${P9K_SUPPRESS_WARNING:-0}" == 0 ]]; then
    echo "No Powerlevel10k config specified. Defaulting to the Powerlevel9k config."
    echo "Run 'p10k configure' to generate your config"
    printf "(and then move the generated file to user_defs/p10k.zsh).\n\n"
    echo "Add 'export P9K_SUPPRESS_WARNING=1' to user_defs/interactive/init.zsh in order to suppress this message."
  fi

  source "${ZDOTDIR}/p9k.zsh"
fi

# I'm not sure what (%) is meant to expand out to, but the default value of %n is equivalent to defaulting to $USERNAME
# (see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Login-information)
# if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Sets the window title to the current directory (not sure how this works or where I got it from...)
export DISABLE_AUTO_TITLE="true"
case $TERM in
xterm*)
  precmd() {print -Pn "\e]0;%~\a"}
  ;;
esac

loadUserDef "interactive/init"

loadModule "interactive/antigen"

loadModule "interactive/completions"
loadUserDef "interactive/completions"

loadModule "interactive/misc"
loadUserDef "interactive/misc"

loadModule "interactive/fzf"

loadUserDef "interactive/finalise"

loadUserDef "p10k"

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U path
