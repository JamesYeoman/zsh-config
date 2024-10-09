# If linuxbrew is installed
if command -v brew &>/dev/null; then
    brew install yarn
    exit 0
fi

REPO="https://dl.yarnpkg.com/debian"
KEYCHAIN_NAME="apt.yarn"

# Download the apt key and install to the keychain
"$INSTALLER_ROOT"/utils/add-an-apt-repo.sh "$REPO" \
    "$KEYCHAIN_NAME" \
    "pubkey.gpg" \
    "${REPO}/ stable main" \
    "yarn"

sudo apt update -qq && sudo apt install --no-install-recommends yarn
