#!/usr/bin/env bash

SCRIPTPATH="$(realpath "$(dirname "$0")")/scripts"
endOfSection() { printf "Done\n\n" }

echo "Installing Docker"
bash "${SCRIPTPATH}/docker.sh"
endOfSection

echo "Installing AdoptOpenJDK versions of the JDK"
bash "${SCRIPTPATH}/adoptopenjdk.sh"
endOfSection

echo "Installing the various 'env's"
bash "${SCRIPTPATH}/jenv.sh"
bash "${SCRIPTPATH}/nodenv.sh"
bash "${SCRIPTPATH}/pyenv.sh"
endOfSection

echo "Installing the Yarn package manager for node"
bash "${SCRIPTPATH}/yarn.sh"
endOfSection

echo "Not auto-installing editors, because they're more of a personal preference."
echo "If you want to have either of the following editors installed, there are scripts provided"
printf "\tJetbrains Toolbox (for Intellij IDEA)\n"
printf "\tVS Code\n\n"
