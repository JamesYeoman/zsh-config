function crawl() {
    local name="$1"
    shift

    local possible_locations=(
        "${XDG_DATA_HOME}/$name" # Default install location
        "${HOME}/.$name" # Left over from a previous non-xdg-compliant install
        $@
    )

    local foundLoc="none"
    for loc in $possible_locations; do
        if [[ -d "$loc" ]]; then
            foundLoc="$loc"
            break;
        fi
    done

    echo $foundLoc
}

function antigen_setup() {
    local foundLoc="$(crawl "antigen" "/usr/share/zsh-antigen")"

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

function antidote_setup() {
    local foundLoc="$(crawl "antidote")"

    if [[ "$foundLoc" == "none" ]]; then
        echo "Antidote not found."
        echo "If you have Antidote installed, it's in an unconventional location."
        echo "Please set ANTIDOTE_INSTALL in ${ZDOTDIR}/user_defs/interactive/init.zsh"
    else
        export ANTIDOTE_INSTALL="$foundLoc"
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
    "antidote")
        antidote_setup
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

unset antigen_setup
unset antidote_setup
unset zi_setup

unset crawl
