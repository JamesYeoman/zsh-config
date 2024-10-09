#!/usr/bin/env bash

source "$(realpath $(dirname $0))/../utils/ensure-xdg-folders-exist.sh"

JENV_ROOT="${XDG_DATA_HOME:-${HOME}/.local/share}/jenv"
JVMS="/usr/lib/jvm"

git clone "https://github.com/jenv/jenv.git" "${JENV_ROOT}"
export PATH="${JENV_ROOT}/bin:${PATH}"
eval "$(jenv init -)"

for version in "${JVMS}"/*/; do
    jenv add "${version}"
done

jenv enable-plugin "maven"
jenv enable-plugin "export"
