sourceIfExists() {
    [[ -e "$1" ]] && source "$1"
}

sourceIfNotExists() {
  [[ -e "$1" ]] || source "$2"
}

loadModule() {
  sourceIfExists "${ZMODDIR}/${1}.zsh"
}
