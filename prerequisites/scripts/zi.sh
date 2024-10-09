if [[ -z "$ZSH_VERSION" ]]; then
    echo "Not running in ZSH! Cannot install and setup ZI!"
    exit 1
fi

if [[ -z "$ZI" ]]; then
    echo "The ZI variable doesn't exist! Please export ZI[HOME_DIR] to specify the root for all ZI-related files"
    exit 1
fi

ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"

git clone https://github.com/z-shell/zi.git "${ZI[BIN_DIR]}"
if [ ! $? ]; then
    echo "\$ZI[HOME_DIR] points to a folder that either doesn't exist, or that you don't have read-write permissions to!"
    exit 1
fi

source "${ZI[BIN_DIR]}/zi.zsh"
zi self-update

echo "Please restart your shell to load the ZI-specific configuration"
