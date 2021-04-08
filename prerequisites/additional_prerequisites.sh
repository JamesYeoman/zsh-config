#!/usr/bin/env bash

SCRIPTPATH="$(realpath "$(dirname "$0")")/scripts"
startOfSection() { printf "Installing ${1}\n" }
endOfSection() { printf "Done\n\n" }

startOfSection "Docker"
bash "${SCRIPTPATH}/docker.sh"
endOfSection

startOfSection "AdoptOpenJDK versions of the JDK"
bash "${SCRIPTPATH}/adoptopenjdk.sh"
endOfSection

startOfSection "Java, Node, and Python version managers"
bash "${SCRIPTPATH}/jenv.sh"
bash "${SCRIPTPATH}/nodenv.sh"
bash "${SCRIPTPATH}/pyenv.sh"
endOfSection

startOfSection "the Yarn package manager for node"
bash "${SCRIPTPATH}/yarn.sh"
endOfSection

echo "Not auto-installing editors, because they're more of a personal preference."
echo "If you want to have either of the following editors installed, there are scripts provided"
printf "\tJetbrains Toolbox (for Intellij IDEA)\n"
printf "\tVS Code\n\n"
