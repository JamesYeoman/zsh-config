if [[ -z "$ZSH_VERSION" ]]; then
	echo "Not running in ZSH! Aborting!"
	exit 1
fi

echo "Value of ZI"
echo "$ZI[HOME_DIR]"

if [[ -z "$ZI" ]]; then
	echo "Could not find '$$ZI[HOME_DIR]'! Please export ZI[HOME_DIR] to specify the root for all ZI-related files!"
	echo "Make sure the folder exists too. Recommended location is $${XDG_DATA_HOME:-$$HOME/.local/share}/zi"
	exit 1
fi
export ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"
git clone https://github.com/z-shell/zi.git "${ZI[BIN_DIR]}"
if [ ! $? ]; then
	echo "\$ZI[HOME_DIR] points to a folder that either doesn't exist, or that you don't have read-write permissions to!"
	exit 1
fi
source "${ZI[BIN_DIR]}/zi.zsh"
zi self-update
echo "Please restart your shell to load the ZI-specific configuration."
echo "Also, make sure your $$ZI[HOME_DIR] definition is in your interactive user definitions init script."
echo "If it's not in that specific script, then ZI won't be loaded."
