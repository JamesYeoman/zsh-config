echo "Ensuring Ubuntu-maintained docker isn't installed"
sudo apt-get remove docker docker-engine docker.io containerd runc \
    && echo "success" \
    || echo "An error occured. It's probably just that there were packages that weren't installed"

REPO="https://download.docker.com/linux/ubuntu"
KEYCHAIN_NAME="apt.docker"

source "${INSTALLER_ROOT}/utils/get-distro-name.sh"
DISTRO_NAME="$(getDistroName)"

if [[ "${DISTRO_NAME}" == "unknown" ]]; then
    echo "lsb_release NOT FOUND!"
    echo "Cannot determine the correct Apt repository without it!"
    exit 1
fi

# Download the apt key and install to the keychain
echo "Adding the Docker APT repository"
"$INSTALLER_ROOT"/utils/add-an-apt-repo.sh "$REPO" \
    "$KEYCHAIN_NAME" \
    "gpg" \
    "${REPO} ${DISTRO_NAME} stable" \
    "docker" \
    "arch=amd64"

echo "Installing Docker"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
