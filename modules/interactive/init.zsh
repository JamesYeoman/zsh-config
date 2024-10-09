function antigen_setup() {
    local possible_locations=(
        "${XDG_DATA_HOME}/antigen" # Install location used by the antigen prerequisites script
        "/usr/share/zsh-antigen"   # sudo apt-get install zsh-antigen
        "${HOME}/.antigen"         # Left over from an old, non-xdg-compliant config, before using this config
    )

    local foundLoc="none"

    for loc in $possible_locations; do
        if [[ -d "$loc" ]]; then
            foundLoc="$loc"
            break;
        fi
    done

    if [[ "$foundLoc" == "none" ]]; then
        echo "Antigen not found."
        echo "If you do have antigen installed, then it's installed in an unconventional location."
        echo "Please set ANTIGEN_INSTALL in ${ZDOTDIR}/user_defs/interactive/init.zsh"
    else
        export ANTIGEN_INSTALL="$foundLoc"
    fi

    fpath+="${ZDOTDIR}/completions/$USER"
    export -U fpath
}

function zi_setup() {
    if [[ -z "$ZI" ]]; then
        echo "Nothing detected in \$ZI and was expecting \$ZI[HOME_DIR] to be set!"
        echo "Make sure 'typeset -Ag ZI' is defined in your user defs interactive init file!"
        echo "Make sure that \$ZI[HOME_DIR] is set to the ZI install location (e.g. /opt/zi, which should contain a folder called bin)"
        return
    fi

    ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"
    ZI[ZCOMPDUMP_PATH]="${HOME}/.cache/zsh/zi/.zcompdump"
    if [[ ! -d "$(dirname $ZI[ZCOMPDUMP_PATH])" ]]; then
        mkdir -p "$(dirname $ZI[ZCOMPDUMP_PATH])"
    fi
}

case "${ZSH_PLUGIN_MANAGER:-antigen}" in
    "antigen")
        antigen_setup
        ;;
    "zi")
        zi_setup
        ;;
    *)
        if [[ -z "$ZSH_PLUGIN_MANAGER_WARN_IGNORE" ]]; then
            echo "ZSH Baseline Config doesn't have any config for $ZSH_PLUGIN_MANAGER"
            echo "Please either use one of the supported managers, or handroll your own manager config."
            echo "If handrolling your own manager config, make sure to set \$ZSH_PLUGIN_MANAGER_WARN_IGNORE"
        fi
        ;;
esac
