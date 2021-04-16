source "${ZDOTDIR}/bootstrap/loading.sh"
export ZMODDIR="${ZDOTDIR}/modules"

mods=( "core" "exports" "opts" "functions" "envs" "xdg" "misc" "aliases" )

for mod in $mods; do
    loadModule "base/${mod}"
done

sourceIfExists "${ZDOTDIR}/user_defs/base.zsh"

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
