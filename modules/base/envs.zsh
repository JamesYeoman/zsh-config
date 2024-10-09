XENV_COMMANDS=()

function exportEnvIfExists() {
    local pth="${XDG_DATA_HOME}/$1"
    if [[ -d "$pth" ]]; then
        eval "export ${1:u}_ROOT=\"${pth}\""

        # Avoid processing commands that have to use workarounds
        case $1 in
        goenv)
            # While goenv has moved $GOPATH/bin to the end of $PATH,
            # https://github.com/syndbg/goenv/issues/99#issuecomment-829783709
            # mentions that $GOENV_ROOT/shims is at the beginning of $PATH,
            # and it hasn't been fixed yet.
            export GOENV_GOPATH_PREFIX="${XDG_DATA_HOME}/go"
            ;;
        *)
            path+="${pth}/bin"
            XENV_COMMANDS+="$1"
            ;;
        esac
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
