fpath+="${ZDOTDIR}/completions/$USER"
export -U fpath

if ! (( $+ANTIGEN_INSTALL )); then
    ANTIGEN_POSSIBLE_LOCATIONS=(
        "${XDG_DATA_HOME}/antigen" # Install location used by the antigen prerequisites script
        "/usr/share/zsh-antigen"   # sudo apt-get install zsh-antigen
        "${HOME}/.antigen"         # Left over from an old, non-xdg-compliant config, before using this config
    )

    foundLoc="none"

    for loc in $ANTIGEN_POSSIBLE_LOCATIONS; do
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
fi

