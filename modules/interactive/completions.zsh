if [[ ! -d "${XDG_CACHE_HOME}/zsh" ]]; then; mkdir -p "${XDG_CACHE_HOME}/zsh"; fi
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/zsh/.zcompcache"

function cmd_completion_not_exist() {
  (( $+commands[$1] )) || return 1
  [[ ! -f "${ZDOTDIR}/completions/${USER}/_$1" ]]
}

if cmd_completion_not_exist "gcloud"; then
  # Despite being zsh-specific, there is no compdef header comment, so zsh can't autoload it...
  printf "#compdef gcloud\n" >"${ZDOTDIR}/completions/${USER}/_gcloud"
  cat "/usr/share/google-cloud-sdk/completion.zsh.inc" >>"${ZDOTDIR}/completions/${USER}/_gcloud"
fi

if cmd_completion_not_exist "kubectl"; then
  kubectl completion zsh >"${ZDOTDIR}/completions/${USER}/_kubectl"
fi

if cmd_completion_not_exist "sbt"; then
  curl "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sbt/_sbt" --output "${ZDOTDIR}/completions/${USER}/_sbt"
fi

unset cmd_completion_not_exist

if (( $+ZI )); then
  zi creinstall -Q "${ZDOTDIR}/completions/$USER"
fi

if (( $+ZSTYLE_FUZZY_COMPLETION )); then
  zstyle ':completion:*' completer _complete _match _approximate
  zstyle ':completion:*:match:*' original only
  zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
else
  zstyle ':completion:*' completer _complete _ignored
  zstyle ':completion:*' menu select
fi

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'

# Unsure of what constitutes a message, as I've tested by adding custom text to it, but I've never encountered it
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true
