#!/usr/bin/env bash

JENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/jenv"
JVMS="/usr/lib/jvm"

git clone "https://github.com/jenv/jenv.git" ${JENV_ROOT}
export PATH="${JENV_ROOT}/bin:${PATH}"
eval "$(jenv init -)"

for version in "${JVMS}"/*/; do
    jenv add "${JVMS}/${version}"
done

jenv enable-plugin "maven"
jenv enable-plugin "export"
