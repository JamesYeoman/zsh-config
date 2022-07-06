source "${INSTALLER_ROOT}/utils/ensure-xdg-folders-exist.sh"

export JENV_ROOT="${XDG_DATA_HOME:-${HOME}/.local/share}/jenv"

echo "Installing jenv to $JENV_ROOT"
git clone "https://github.com/jenv/jenv.git" "$JENV_ROOT"
export PATH="${JENV_ROOT}/bin:$PATH"

echo "Starting up jenv in this shell"
eval "$(jenv init -)"

echo "Detecting and adding installed JVMs"
for version in /usr/lib/jvm/*/; do
    jenv add "$version"
done

jenv enable-plugin "maven"
jenv enable-plugin "export"
