source "${SHELL_CONF}/antigen.zsh"
source "${SHELL_CONF}/aliases.zsh"
source "${SHELL_CONF}/exports.zsh"
source "${SHELL_CONF}/functions.zsh"

if command -v jenv &>/dev/null; then
	eval "$(jenv init -)"
fi

if command -v pyenv &>/dev/null; then
	eval "$(pyenv init -)"
fi

if command -v nodenv &>/dev/null; then
	eval "$(nodenv init -)"
fi

# fzf is Fuzzy Find tool https://github.com/junegunn/fzf
[ -e "${PERSONAL_ETC}/fzf/fzf.zsh" ] && source "${PERSONAL_ETC}/fzf/fzf.zsh"

#This is to allow the themes to be able to display the correct name in the prompt
export DEFAULT_USER="$(whoami)"

# Sets the window to just the current directory
export DISABLE_AUTO_TITLE="true"
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac
