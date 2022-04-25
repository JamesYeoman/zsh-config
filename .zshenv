zstyle ':completion:*' completer _complete _ignored cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"

source "${ZDOTDIR}/bootstrap/loading.sh"
export ZMODDIR="${ZDOTDIR}/modules"
export USER_DEFS="${ZDOTDIR}/user_defs"

loadModule "base/core"
loadUserDef "base/core"

loadModule "base/optional"

loadModule "base/functions"
loadUserDef "base/functions"

loadModule "base/opts"
loadUserDef "base/opts"

loadModule "base/envs"

loadModule "base/path"

loadModule "base/postprocess"
loadUserDef "base/postprocess"

loadModule "base/aliases"
loadUserDef "base/aliases"
