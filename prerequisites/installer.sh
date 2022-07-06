#!/usr/bin/env bash
INSTALLER_ROOT="$(realpath $(dirname $0))"

INST_MODULE=unset

modules_tmp=( $(ls scripts) )
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
    exit 1
}

PARSED_ARGUMENTS=$(getopt -n installer.sh -o m:l --long module:,list -- "$@")
if [ "$?" != "0" ]; then
    usage
fi

eval set -- "$PARSED_ARGUMENTS"

while [ "$#" -gt "0" ]; do
    case "$1" in
        -m | --module) 
            INST_MODULE="$2"
            shift 2
            ;;
        -l | --list)
            list_modules
            exit 0
            ;;
        --) shift; ;;
    esac
done


if [[ "$INST_MODULE" == "unset" ]]; then
    usage
fi

if ! [[ " ${available_modules[@]} " =~ " $INST_MODULE " ]]; then
    echo "Could not find module ${MODULE} in ${INSTALLER_ROOT}/scripts."
    exit 1
fi

source "${INSTALLER_ROOT}/utils/ensure-xdg-folders-exist.sh"
source "${INSTALLER_ROOT}/scripts/${MODULE}.sh"
