source "${INSTALLER_ROOT}/utils/ensure-xdg-folders-exist.sh"

DATA_XDG="${XDG_DATA_HOME:-${HOME}/.local/share}"

echo "Downloading Jetbrains Toolbox"
URL='https://data.services.jetbrains.com/products/download?platform=linux&code=TBA'
curl -fsSL "$URL" | tar -zxv --strip-components 1 --transform="s/jetbrains-toolbox*/jetbrains-toolbox/g" -C "$INSTALLER_ROOT" &>/dev/null
installationLoc="${DATA_XDG}/JetBrains/Toolbox"

echo "Installing a desktop entry for Jetbrains Toolbox"
EXEC="${installationLoc}/bin/jetbrains-toolbox"
ICON="${installationLoc}/toolbox.svg"

installParams=(--dir="${DATA_XDG}/applications" --rebuild-mime-info-cache --set-key="Exec" --set-value="$EXEC" --set-icon="$ICON")
desktop-file-install "${installParams[@]}" "$INSTALLER_ROOT"/utils/jetbrains.desktop

# This should download Jetbrains Toolbox to the ~/.local/share/JetBrains/Toolbox folder
# If not, this script will need rethinking
echo "Starting Jetbrains Toolbox"
./jetbrains-toolbox

# Breaking up the disclaimer into multiple variables to make the lines actually fit reasonably inside an editor
disclaimerLine1="Seeing as though it would take significant effort to try to detect whether or not Toolbox has finished \
bootstrapping itself, I decided to just leave cleanup to the end-user."
disclaimerLine2="So this disclaimer is me telling you that you need to delete ${INSTALLER_ROOT}/jetbrains-toolbox \
(not ${INSTALLER_ROOT}/jetbrains-toolbox.sh) ONLY AFTER the jetbrains toolbox window first appears."
echo "$disclaimerLine1"
echo "$disclaimerLine2"
