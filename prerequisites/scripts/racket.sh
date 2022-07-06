source "${INSTALLER_ROOT}/utils/ensure-xdg-folders-exist.sh"

echo "Adding the Racket APT Repository"
sudo add-apt-repository --yes ppa:plt/racket

echo "Updating the APT Cache"
sudo apt update

echo "Installing Racket"
sudo apt install -qqy racket

echo "Adding a custom Gnome Menu file so that XDG Compliance is session-wide"

DATA_XDG="${XDG_DATA_HOME:-${HOME}/.local/share}"
EXEC="env PLTUSERHOME=${DATA_XDG}/racket drracket -singleInstance %F"

if [[ -z "${DATA_XDG}/racket" ]]; then
    mkdir "${DATA_XDG}/racket"
fi

installParams=(--dir="${DATA_XDG}/applications" --rebuild-mime-info-cache --set-key="Exec" --set-value="$EXEC")
desktop-file-install "${installParams[@]}" "${INSTALLER_ROOT}/utils/drracket.desktop"
