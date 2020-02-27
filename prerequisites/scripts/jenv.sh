#!/usr/bin/env bash

mkdir -p ${HOME}/.local/etc
git clone https://github.com/jenv/jenv.git ${HOME}/.local/etc/jenv

JENV_ROOT="${HOME}/.local/etc/jenv"
export PATH="${JENV_ROOT}/bin:${PATH}"

eval "$(jenv init -)"

JDK_VERSIONS=(adoptopenjdk-11-hotspot adoptopenjdk-11-hotspot-jre)
JDK_VERSIONS+=(adoptopenjdk-12-hotspot adoptopenjdk-12-hotspot-jre)
JDK_VERSIONS+=(adoptopenjdk-13-hotspot adoptopenjdk-13-hotspot-jre)

for version in "${JDK_VERSIONS[@]}"; do
    jenv add "/usr/lib/jvm/${version}-amd64"
done

jenv enable-plugin maven
jenv enable-plugin export
