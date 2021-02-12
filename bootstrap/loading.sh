sourceIfExists() {
    [[ -e "$1" ]] && source "$1"
}

loadModule() {
  sourceIfExists "${ZMODDIR}/${1}.zsh"
}
