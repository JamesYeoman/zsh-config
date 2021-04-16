source "${ZDOTDIR}/bootstrap/loading.sh"
export ZMODDIR="${ZDOTDIR}/modules"
export USER_DEFS="${ZDOTDIR}/user_defs"

mods=( "core" "exports" "opts" "functions" "envs" "xdg" "misc" "aliases" )

for mod in $mods; do
    loadModule "base/${mod}"
done

sourceIfExists "${USER_DEFS}/base.zsh"

# Exports path in a way that there will be no duplicate path items from shell re-initialisation
export -U PATH
