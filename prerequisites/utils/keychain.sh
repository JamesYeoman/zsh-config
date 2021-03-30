#!/usr/bin/env bash

URL="$1"
FILENAME="${2}.gpg"
TMP_FILE="/tmp/${FILENAME}"
KEY_INSTALL="/usr/share/keyrings/${FILENAME}"

# Get the GPG key
wget -q "${URL}" -O "${TMP_FILE}"

# Check for ASCII-Armoured GPG key
if file "${TMP_FILE}" | grep "PGP public key block" ; then
    # De-armour the GPG key
    mv "${TMP_FILE}" "${TMP_FILE}.bak"
    cat "${TMP_FILE}.bak" | gpg --dearmor > "${TMP_FILE}"
    rm "${TMP_FILE}.bak"
fi

# The GPG key is now definitely unarmoured

if [[ ! -d "/usr/share/keyrings" ]] ; then
    sudo mkdir /usr/share/keyrings
    sudo chmod 755 /usr/share/keyrings
fi

# Remove the existing GPG key if there is one
[[ -f "${KEY_INSTALL}" ]] && sudo rm "${KEY_INSTALL}"

# Move the temporary file to a permanent location, with appropriate permissions
sudo mv "${TMP_FILE}" "${KEY_INSTALL}"
sudo chown root "${KEY_INSTALL}"
sudo chmod 644 "${KEY_INSTALL}"
