zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "${HOME}/.zshrc"
export TERM=xterm-256color
export SHELL_CONF="${HOME}/.config/zsh"
export CLOUDSDK_HOME="/usr/lib/google-cloud-sdk"
[[ ! -d "${SHELL_CONF}" ]] && mkdir -p "${SHELL_CONF}"

sourceIfExists() {
    [[ -e "$1" ]] && source "$1"
}

sourceIfExists "${SHELL_CONF}/antigen.zsh"
sourceIfExists "${SHELL_CONF}/exports.zsh"
sourceIfExists "${SHELL_CONF}/opts.zsh"
sourceIfExists "${SHELL_CONF}/functions.zsh"
sourceIfExists "${SHELL_CONF}/envs.zsh"
sourceIfExists "${SHELL_CONF}/aliases.zsh"

# Sets the window title to the current directory
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# fzf is Fuzzy Find tool https://github.com/junegunn/fzf
sourceIfExists "${PERSONAL_ETC}/fzf/fzf.zsh"

export fpath=( "${PERSONAL_ETC}/zsh/completions" "${fpath[@]}" )

updateGoogleCompletions() {
  local compFolder
  compFolder="${PERSONAL_ETC}/zsh/completions"
  tee "$compFolder/_gcloud" <<-EOF >/dev/null
#compdef gcloud
EOF
  cat "/usr/share/google-cloud-sdk/completion.zsh.inc" >> "$compFolder/_gcloud"
  kubectl completion zsh > "$compFolder/_kubectl"
  rm ${HOME}/.zcompdump
  compinit -d "$HOME/.zcompdump"
}

# Used by the Snap Store tool
emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
