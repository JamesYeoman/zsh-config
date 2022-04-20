function commandBundle() {
    if (( ${+commands[$1]} )); then
        antigen bundle "$1"
    fi
}

# ANTIGEN_INSTALL should be specified in the interactive init userdef, if required
INST_FALLBACK="${XDG_DATA_HOME}/antigen"
if [[ -d "${ANTIGEN_INSTALL:-$INST_FALLBACK}" ]]; then
    source "${ANTIGEN_INSTALL:-$INST_FALLBACK}/antigen.zsh"
    antigen use "oh-my-zsh"

    commandBundle "git"
    commandBundle "pip"
    commandBundle "python"
    commandBundle "docker"

    antigen bundle "command-not-found"
    
    antigen bundle "zsh-users/zsh-syntax-highlighting"
    antigen bundle "zsh-users/zsh-completions src"

    loadUserDef "interactive/antigen"

    #A theme from oh-my-zsh
    #Visit https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
    #and https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes
    #to find plenty of alternative themes
    antigen theme "romkatv/powerlevel10k"

    antigen apply
    antigen selfupdate
fi

unset INST_FALLBACK
unset commandBundle
