#!/usr/bin/env bash

JENV_ROOT="${HOME}/.local/share/jenv"
git clone https://github.com/jenv/jenv.git ${JENV_ROOT}

export PATH="${JENV_ROOT}/bin:${PATH}"

eval "$(jenv init -)"

JDK_VERSIONS=(adoptopenjdk-11-hotspot)

for version in "${JDK_VERSIONS[@]}"; do
    jenv add "/usr/lib/jvm/${version}-amd64"
done

jenv enable-plugin maven
jenv enable-plugin export
