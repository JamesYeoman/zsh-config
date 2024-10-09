for xenv in $XENV_COMMANDS; do
    eval "$("$xenv" init - --no-rehash)"
done

# Fix for problem mentioned at https://github.com/syndbg/goenv/issues/99#issuecomment-829783709
if (( $+GOENV_ROOT )); then
    export GOENV_SHELL=zsh
    export PATH="${PATH}:${GOENV_ROOT}/shims:${GOENV_ROOT}/bin"

    source "${GOENV_ROOT}/completions/goenv.zsh"
    command goenv rehash 2>/dev/null
    function goenv() {
        local command
        command="$1"
        if [ "$#" -gt 0 ]; then
            shift
        fi

        case "$command" in
        rehash|shell)
            eval "$(goenv "sh-$command" "$@")";;
        *)
            command goenv "$command" "$@";;
        esac
    }

    goenv rehash --only-manage-paths
fi

if (( $+PYENV_ROOT )); then
    eval "$(pyenv init --path)"

    if [[ -d "${PYENV_ROOT}/plugins/pyenv-virtualenv" ]]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi
