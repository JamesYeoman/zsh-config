compFolder="${XDG_DATA_HOME}/zsh/completions"
zdumpfile="${XDG_CACHE_HOME}/zsh/zcompdump"

export fpath=( "${compFolder}" "${fpath[@]}" )

updateGoogleCompletions() {
  echo "#compdef gcloud" > "${compFolder}/_gcloud"
  cat "/usr/share/google-cloud-sdk/completion.zsh.inc" >> "$compFolder/_gcloud"
  kubectl completion zsh > "$compFolder/_kubectl"
  rm "${zdumpfile}"
  compinit -d "${zdumpfile}"
}

