# ANTIGEN_INSTALL should be specified in the interactive init userdef, if required
source "${ANTIGEN_INSTALL}/antigen.zsh"
antigen use "oh-my-zsh"

antigen bundle "git"
antigen bundle "command-not-found"
antigen bundle "fzf"

# # Not too useful to the majority of people as the aliases added don't really
# # add much beyond situational needs, and the functions added make me feel 
# # uneasy (e.g. pyuserpaths). Adding site-packages _blindly_ is just asking for trouble.
# antigen bundle "python"

if (( $+commands[pip] )); then
    # Oh My ZSH incorrectly defaults to ~/.pip if $XDG_CACHE_HOME/pip doesn't exist.
    # See https://github.com/ohmyzsh/ohmyzsh/blob/8f56a8bdf39d7727ab0e220f0164f78c77f9c50e/plugins/pip/pip.plugin.zsh#L15
    if [[ ! -d "${XDG_CACHE_HOME}/pip" ]]; then
        mkdir "${XDG_CACHE_HOME}/pip"
    fi

    # Sets up pip completions.
    antigen bundle "pip"
fi

# Sets up rustup and cargo completions.
# Handles detecting rustup and cargo automatically
# so no need to conditionally load
antigen bundle "rust"

antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen bundle "zsh-users/zsh-completions src"

# A theme from oh-my-zsh
#
# Visit https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# and https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes
# to find plenty of alternative themes
antigen theme "romkatv/powerlevel10k"

loadUserDef "interactive/antigen"

antigen apply
antigen selfupdate
