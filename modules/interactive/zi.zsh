source "${ZI[BIN_DIR]}/zi.zsh"
zi compinit -Q
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

setopt promptsubst
setopt interactivecomments

zi snippet 'OMZL::functions.zsh'
zi snippet 'OMZL::key-bindings.zsh'
zi snippet 'OMZL::completion.zsh'
zi snippet 'OMZL::git.zsh'
zi snippet 'OMZL::grep.zsh'
zi snippet 'OMZL::theme-and-appearance.zsh'
zi snippet 'OMZL::vcs_info.zsh'

zi wait'!' lucid for "OMZL::prompt_info_functions.zsh"

zi snippet 'OMZP::fzf'
zi snippet 'OMZP::command-not-found'
zi snippet 'OMZP::git'

if (( $+commands[rustc] )); then
    zi snippet 'OMZP::rust'
    zi ice as"completion"
    zi snippet 'OMZP::rust/_rustc'
fi

if (( $+commands[pip] )); then
    # Oh My ZSH incorrectly defaults to ~/.pip if $XDG_CACHE_HOME/pip doesn't exist.
    # See https://github.com/ohmyzsh/ohmyzsh/blob/8f56a8bdf39d7727ab0e220f0164f78c77f9c50e/plugins/pip/pip.plugin.zsh#L15
    if [[ ! -d "${XDG_CACHE_HOME}/pip" ]]; then; mkdir "${XDG_CACHE_HOME}/pip"; fi

    zi snippet 'OMZP::pip'
    zi ice as"completion"
    zi snippet 'OMZP::pip/_pip'
fi    

zi wait lucid for \
    atinit"zicompinit; zicdreplay" \
    z-shell/F-Sy-H \
    blockf atpull'zi creinstall -q .' \
    zsh-users/zsh-completions

zi ice depth=1
zi load "romkatv/powerlevel10k"

loadUserDef "interactive/zi"
