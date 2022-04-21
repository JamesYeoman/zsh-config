compFolder="${XDG_DATA_HOME}/zsh/completions"

fpath+="${compFolder}"
export -U fpath

updateGoogleCompletions() {
  echo "#compdef gcloud" >"${compFolder}/_gcloud"
  cat "/usr/share/google-cloud-sdk/completion.zsh.inc" >>"$compFolder/_gcloud"
  kubectl completion zsh >"$compFolder/_kubectl"
  rm "${ZDOTDIR}/.zcompdump"
  compinit
}
