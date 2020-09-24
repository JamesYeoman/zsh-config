sourceIfExists() {
    [[ -e "$1" ]] && source "$1"
}

loadModule() {
  sourceIfExists "${ZMODDIR}/${1}.zsh"
}

mods=( "user_defs" "zsh_conf" "antigen" "exports" "opts" "functions" "envs" "xdg" "completions" )

sourceIfExists "${ZDOTDIR}/modules/core.zsh"

pushd "${ZMODDIR}" > /dev/null
for file in aliases/*; do
  mods+=( "${file%.*}" )
done
popd > /dev/null

for mod in $mods; do
  loadModule $mod
done

# fzf is Fuzzy Find tool https://github.com/junegunn/fzf
sourceIfExists "${XDG_CONFIG_HOME:-$HOME_ROOT/.config}/fzf/fzf.zsh"

# Needs to be done right at the end, which is why it isn't included in $mods
loadModule "finalise"
