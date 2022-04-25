#!/usr/bin/env bash

URL="$1"
FILENAME="${2}.gpg"
TMP_FILE="/tmp/$FILENAME"
KEY_INSTALL="/usr/share/keyrings/$FILENAME"

echo "Downloading $URL"

# Get the GPG key
wget -q "$URL" -O "$TMP_FILE"

# Check for ASCII-Armoured GPG key
if file "$TMP_FILE" | grep "PGP public key block"; then
    echo "GPG Key is ASCII-Armoured. De-armouring the key..."
    # De-armour the GPG key
    mv "$TMP_FILE" "${TMP_FILE}.bak"
    cat "${TMP_FILE}.bak" | gpg --dearmor >"$TMP_FILE"
    rm "${TMP_FILE}.bak"

    echo "Successfully de-armoured!"
fi

# The GPG key is now definitely unarmoured

if [[ ! -d "/usr/share/keyrings" ]]; then
    echo "The /usr/share/keyrings directory doesn't exist. Creating..."
    sudo mkdir /usr/share/keyrings
    sudo chmod 755 /usr/share/keyrings
fi

# Handle existing keys gracefully
if [[ -f "$KEY_INSTALL" ]]; then
    echo "${KEY_INSTALL} already exists!"

    echo "Do you want to replace it?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes )
                break
                ;;
            No )
                exit
                ;;
        esac
    done

    echo "Removing existing GPG key..."
    sudo rm "$KEY_INSTALL"
fi

# Move the temporary file to a permanent location, with appropriate permissions

echo "Installing ${KEY_INSTALL}..."
sudo mv "$TMP_FILE" "$KEY_INSTALL"
sudo chown root "$KEY_INSTALL"
sudo chmod 644 "$KEY_INSTALL"

echo "Successfully installed $KEY_INSTALL"
