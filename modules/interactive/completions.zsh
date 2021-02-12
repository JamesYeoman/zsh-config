compFolder="${XDG_DATA_HOME:-$HOME_ROOT/share}/zsh/completions"

export -U fpath=( "${compFolder}" "${fpath[@]}" )

updateGoogleCompletions() {
  echo "#compdef gcloud" > "${compFolder}/_gcloud"
  cat "/usr/share/google-cloud-sdk/completion.zsh.inc" >> "$compFolder/_gcloud"
  kubectl completion zsh > "$compFolder/_kubectl"
  rm "${ZDOTDIR}/.zcompdump"
  compinit
}

