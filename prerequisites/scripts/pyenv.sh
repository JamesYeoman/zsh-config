source "${INSTALLER_ROOT}/utils/ensure-xdg-folders-exist.sh"

export PYENV_ROOT="${XDG_DATA_HOME:-${HOME}/.local/share}/pyenv"
git clone "https://github.com/pyenv/pyenv.git" "$PYENV_ROOT"

export PATH="${PYENV_ROOT}/bin:$PATH"

eval "$(pyenv init -)"
