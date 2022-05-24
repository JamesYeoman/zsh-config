# For some reason, only the completion scripts are split off into /usr/share...
if [[ -f "/usr/share/google-cloud-sdk/completion.zsh.inc" ]]; then
  if [[ ! -f "${ZDOTDIR}/completions/_gcloud" ]]; then
    ln -s "/usr/share/google-cloud-sdk/completion.zsh.inc" "${ZDOTDIR}/completions/_gcloud"
  fi
fi

if (( ${+commands[kubectl]} )) && [[ ! -f "${ZDOTDIR}/completions/_kubectl" ]]; then
  kubectl completion zsh >"${ZDOTDIR}/completions/_kubectl"
fi

if (( $+commands[sbt] )) && [[ ! -f "${ZDOTDIR}/completions/_sbt" ]]; then
  curl "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sbt/_sbt" --output "${ZDOTDIR}/completions/_sbt"
fi
