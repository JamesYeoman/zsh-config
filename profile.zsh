source "${SHELL_CONF}/antigen.zsh"
source "${SHELL_CONF}/aliases.zsh"
source "${SHELL_CONF}/exports.zsh"
source "${SHELL_CONF}/functions.zsh"

if testForCommand jenv; then
	eval "$(jenv init -)"
fi

if testForCommand pyenv; then
	eval "$(pyenv init -)"
fi

if testForCommand nodenv; then
	eval "$(nodenv init -)"
fi

if testForCommand sbtenv; then
    eval "$(sbtenv init -)"
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
