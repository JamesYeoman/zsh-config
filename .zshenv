skip_global_compinit=1

source "${ZDOTDIR}/bootstrap/loading.sh"
export ZMODDIR="${ZDOTDIR}/modules"
export USER_DEFS="${ZDOTDIR}/user/$USER"

user_defs_stat="$(stat -c '%a' $APPIMAGE_BIN)"
if getfacl -p "$USER_DEFS" | grep 'group::\|other::' | grep '.w.' 2>&1 >/dev/null; then
    echo "${USER_DEFS} is writable by others than yourself!"
    echo "${USER_DEFS} should only be writable by you!"
fi

loadModule "base/core"
loadUserDef "base/core"

loadModule "base/history"
loadUserDef "base/history"

loadModule "base/functions"
loadUserDef "base/functions"

loadModule "base/opts"
loadUserDef "base/opts"

loadModule "base/envs"

loadModule "base/path"
loadUserDef "base/path"

loadModule "base/postprocess"
loadUserDef "base/postprocess"

loadModule "base/aliases"
loadUserDef "base/aliases"
