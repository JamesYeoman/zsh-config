if command -v task > /dev/null; then
    echo "Taskfile is already installed! The executable name is \`task\`"
    exit 0
fi

SYS_INSTALL=1

if [[ -z "$TASKFILE_INSTALLER_SYS_INSTALL" ]]; then
    echo "Could not find variable TASKFILE_INSTALLER_SYS_INSTALL, defaulting to local install"

    if [[ -z "$TASKFILE_INSTALLER_INSTALL_LOC" ]]; then
        echo "Could not find variable TASKFILE_INSTALLER_INSTALL_LOC."
        echo "Please set TASKFILE_INSTALLER_INSTALL_LOC to your personal binary folder, making sure it's on your \$PATH"
        exit 1
    fi
    INSTALL_LOC="$TASKFILE_INSTALLER_INSTALL_LOC"
fi

sysAutoDetect() {
    case ":$PATH:" in
        *":/usr/local/bin:"*)
            FOUND_LOC="/usr/local/bin"
        ;;
        *":/usr/bin:"*)
            FOUND_LOC="/usr/bin"
        ;;
        *)
            echo "No suitable binary folder found in PATH!"
            echo "Neither /usr/local/bin nor /usr/bin were found!"
            echo "/bin is not acceptable to write a tool binary to!"
            exit 1
        ;;
    esac
}

if [ -n "$INSTALL_LOC" ]; then
    FOUND_LOC="$INSTALL_LOC"
else
    SYS_INSTALL=0
    sysAutoDetect
fi

if ! [ -w "$FOUND_LOC" ]; then
    echo "No write permissions to the location of $FOUND_LOC"
    exit 1
fi

INSTALLER=unset
if command -v curl > /dev/null; then
    INSTALLER="$(curl --location https://taskfile.dev/install.sh)"
elif command -v wget > /dev/null; then
    INSTALLER="$(wget -qO- https://taskfile.dev/install.sh)"
else
    echo "Neither curl nor wget were found! Unable to proceed!"
    exit 1
fi

if [ $SYS_INSTALL ]; then
    sudo sh -c "$INSTALLER" -- -d -b "$FOUND_LOC"
else
    sh -c "$INSTALLER" -- -d -b "$FOUND_LOC"
fi

if [ "$?" != 0 ]; then
    echo "Error while installing Taskfile..."
    exit 1
fi

echo "Taskfile successfully installed! Executable name is \`task\`"
