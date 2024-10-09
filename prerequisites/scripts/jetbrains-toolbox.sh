#!/usr/bin/env bash

ROOT="$(realpath $(dirname $0))"

source "${ROOT}/../utils/ensure-xdg-folders-exist.sh"

CFG_XDG="${XDG_CONFIG_HOME:-${HOME}/.config}"

if [[ -z "${CFG_XDG}/autostart" ]]; then
    mkdir "${CFG_XDG}/autostart"
fi

URL='https://data.services.jetbrains.com/products/download?platform=linux&code=TBA'
curl -fsSL $URL | tar -zxv --strip-components 1 --transform="s/jetbrains-toolbox*/jetbrains-toolbox/g" &>/dev/null
installationLoc="${XDG_DATA_HOME:-${HOME}/.local/share}/JetBrains/Toolbox"

# Touching the file before writing to it in order to avoid "this file doesn't exist" error messages
touch "${CFG_XDG}/autostart/jetbrains-toolbox.desktop"

cat "${ROOT}/../utils/jetbrains.template.desktop" |
    sed "s:{{EXECLINE}}:Exec=${installationLoc}/bin/jetbrains-toolbox --minimize:" |
    sed "s:{{ICONLINE}}:Icon=${installationLoc}/toolbox.svg:" >"${CFG_XDG}/autostart/jetbrains-toolbox.desktop"

# This should download Jetbrains Toolbox to the ~/.local/share/Jetbrains/Toolbox folder
# If not, this script will need rethinking
./jetbrains-toolbox

# Breaking up the disclaimer into multiple variables to make the lines actually fit reasonably inside an editor
disclaimerLine1="Seeing as though it would take significant effort to try to detect whether or not Toolbox has finished \
bootstrapping itself, I decided to just leave cleanup to the end-user."
disclaimerLine2="So this disclaimer is me telling you that you need to delete the jetbrains-toolbox \
file (not jetbrains-toolbox.sh) ONLY AFTER the jetbrains toolbox window first appears."
echo "${disclaimerLine1}"
echo "${disclaimerLine2}"
