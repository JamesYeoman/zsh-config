XENV_COMMANDS=()

function exportEnvIfExists() {
    local pth="${XDG_DATA_HOME}/$1"
    if [[ -d "$pth" ]]; then
        eval "export ${1:u}_ROOT=\"${pth}\""
        path+="${pth}/bin"
        XENV_COMMANDS+="$1"
    fi
}

exportEnvIfExists "jenv"
exportEnvIfExists "pyenv"
exportEnvIfExists "nodenv"
exportEnvIfExists "sbtenv"
exportEnvIfExists "scalaenv"
exportEnvIfExists "goenv"
exportEnvIfExists "rbenv"
exportEnvIfExists "phpenv"

unset exportEnvIfExists
export XENV_COMMANDS
