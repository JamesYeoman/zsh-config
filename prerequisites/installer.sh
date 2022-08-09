#!/usr/bin/env bash
INSTALLER_ROOT="$(realpath $(dirname $0))"

pushd $INSTALLER_ROOT > /dev/null
modules_tmp=( $(ls scripts) )
popd > /dev/null
available_modules=( )
for inst in "${modules_tmp[@]}"; do
    available_modules+=("${inst%.sh}")
done

if ! command -v getopt > /dev/null; then
    echo "Unable to run! Missing getopt (a GNU binary)!"
    exit 1
fi

list_modules() {
    for mod in "${available_modules[@]}"; do
        echo "$mod"
    done
}

usage() {
    echo "Usage:"
    echo "  installer.sh [ -m | --module=<installer-script> ]"
    echo "  installer.sh [ -l | --list ]"
}

PARSED_ARGUMENTS=$(getopt -n installer.sh -o m:lh --long module:,list,help -- "$@")
if [ "$?" != "0" ]; then
    usage
    exit 1
fi

eval set -- "$PARSED_ARGUMENTS"

while [ "$#" -gt 0 ]; do
    case "$1" in
        -m | --module) 
            INST_MODULE="$2"
            shift 2
            ;;
        -l | --list)
            list_modules
            exit 0
            ;;
        -h | --help)
            usage
            exit 0
            ;;
        --)
            shift
            ;;
        *)
            echo "[Error] Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done


if [[ -z "$INST_MODULE" ]]; then
    usage
    exit 1
fi

if ! [[ " ${available_modules[@]} " =~ " $INST_MODULE " ]]; then
    echo "Could not find module ${INST_MODULE} in ${INSTALLER_ROOT}/scripts."
    exit 1
fi

source "${INSTALLER_ROOT}/utils/ensure-xdg-folders-exist.sh"
source "${INSTALLER_ROOT}/scripts/${INST_MODULE}.sh"
