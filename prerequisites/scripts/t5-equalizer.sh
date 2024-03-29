# https://t-5.eu/hp/Home/
# Contains some great linux audio tools
# (like the parametric equalizer that this script installs)

REPO="https://t-5.eu/debian"
KEYCHAIN_NAME="apt.t5.eu"

# Download the apt key and install to the keychain
"$INSTALLER_ROOT"/utils/add-an-apt-repo.sh "$REPO" \
    "$KEYCHAIN_NAME" \
    "pubkey.txt" \
    "${REPO}/ repo main" \
    "t5.eu"

sudo apt update -qq
sudo apt install pulseaudio-parametric-eq

echo "Remember to try and find your headphones in https://github.com/jaakkopasanen/AutoEq/tree/master/results/rtings"
