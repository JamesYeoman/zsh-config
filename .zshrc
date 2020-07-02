sourceIfExists() {
    [[ -e "$1" ]] && source "$1"
}

loadModule() {
  sourceIfExists "${ZMODDIR}/${1}.zsh"
}

mods=( zsh_conf antigen exports opts functions envs xdg completions )

sourceIfExists "${ZDOTDIR}/modules/core.zsh"

for file in "${ZMODDIR}/aliases/*"; do
  mods+=( "${file%.*}" )
done

for mod in $mods; do
  loadModule $mod
done

# fzf is Fuzzy Find tool https://github.com/junegunn/fzf
sourceIfExists "${XDG_DATA_HOME}/fzf/fzf.zsh"

# Needs to be done right at the end, which is why it isn't included in $mods
sourceIfExists "${ZMODDIR}/finalise.zsh"
