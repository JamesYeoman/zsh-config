#!/usr/bin/env bash

JENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/jenv"
git clone "https://github.com/jenv/jenv.git" ${JENV_ROOT}

export PATH="${JENV_ROOT}/bin:${PATH}"

eval "$(jenv init -)"

for version in "/usr/lib/jvm"/*/; do
    jenv add "/usr/lib/jvm/${version}"
done

jenv enable-plugin "maven"
jenv enable-plugin "export"
