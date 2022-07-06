REPO="https://packages.microsoft.com"
KEYCHAIN_NAME="apt.microsoft"

# Download the apt key and install to the keychain
"$INSTALLER_ROOT"/utils/add-an-apt-repo.sh "$REPO" \
    "$KEYCHAIN_NAME" \
    "keys/microsoft.asc" \
    "${REPO}/repos/vscode stable main" \
    "vscode" \
    "arch=amd64"

sudo apt update -qq && sudo apt install -qqy code
