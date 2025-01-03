source "${ZDOTDIR}/bootstrap/loading.sh"

# Sets the window title to the current directory (not sure how this works or where I got it from...)
export DISABLE_AUTO_TITLE="true"
case $TERM in
xterm*)
  precmd() {print -Pn "\e]0;%~\a"}
  ;;
esac

loadUserDef "interactive/init"
loadModule "interactive/init"

loadModule "interactive/misc"
loadUserDef "interactive/misc"

case "$ZSH_PLUGIN_MANAGER" in
  antigen)
    MANAGER_INSTALL_LOC="$ANTIGEN_INSTALL"
    MANAGER_MODULE="antigen"
    ;;
  antidote)
    MANAGER_INSTALL_LOC="$ANTIDOTE_INSTALL"
    MANAGER_MODULE="antidote"
    ;;
  zi)
    MANAGER_INSTALL_LOC="${ZI[HOME_DIR]}"
    MANAGER_MODULE="zi"
    ;;
esac

if [[ -d "$MANAGER_INSTALL_LOC" ]]; then
  loadModule "interactive/$MANAGER_MODULE"
fi

loadModule "interactive/completions"
loadUserDef "interactive/completions"

if command -v p10k 2>&1 >/dev/null; then
  if [[ -f "${USER_DEFS}/p10k.zsh" ]]; then
    source "${USER_DEFS}/p10k.zsh"
  else
    # Fallback to the powerlevel9k config if powerlevel10k hasn't been configured
    if [[ "${P9K_SUPPRESS_WARNING:-0}" == 0 ]]; then
      echo "No Powerlevel10k config specified. Defaulting to the Powerlevel9k config."
      echo "Run 'p10k configure' to generate your config"
      printf "(and then move the generated file to ${USER_DEFS}/p10k.zsh).\n\n"
      echo "Add 'export P9K_SUPPRESS_WARNING=1' to ${USER_DEFS}/interactive/init.zsh in order to suppress this message."
    fi

    source "${ZDOTDIR}/p9k.zsh"
  fi

  if [[ -n "$P10K_INSTANT_PROMPT_ENABLE" ]]; then
    # I'm not sure what (%) is meant to expand out to, but the default value of %n is equivalent to defaulting to $USERNAME
    # (see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Login-information)
    if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
  fi
fi

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U path

loadUserDef "interactive/finalise"
