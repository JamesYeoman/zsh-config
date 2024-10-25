source "${ANTIDOTE_INSTALL}/antidote.zsh"

function construct_plugins() {
    # Initialise OMZ
    echo "getantidote/use-omz"

    # Load OMZ's library
    echo "ohmyzsh/ohmyzsh path:lib"

    echo "ohmyzsh/ohmyzsh path:plugins/git"
    echo "ohmyzsh/ohmyzsh path:plugins/command-not-found"
    echo "ohmyzsh/ohmyzsh path:plugins/fzf"

    if (( $+commands[pip] )); then
        # Oh My ZSH incorrectly defaults to ~/.pip if $XDG_CACHE_HOME/pip doesn't exist.
        # See https://github.com/ohmyzsh/ohmyzsh/blob/8f56a8bdf39d7727ab0e220f0164f78c77f9c50e/plugins/pip/pip.plugin.zsh#L15
        if [[ ! -d "${XDG_CACHE_HOME}/pip" ]]; then
            mkdir "${XDG_CACHE_HOME}/pip"
        fi

        echo "ohmyzsh/ohmyzsh path:plugins/pip"
        echo "ohmyzsh/ohmyzsh path:plugins/pip/_pip kind:fpath"
    fi

    if (( $+commands[rustc] )); then
        echo "ohmyzsh/ohmyzsh path:plugins/rust/_rustc kind:fpath"
    fi

    # Sets up rustup and cargo completions.
    # Handles detecting rustup and cargo automatically, so no need to conditionally load
    echo "ohmyzsh/ohmyzsh path:plugins/rust"

    echo "zsh-users/zsh-syntax-highlighting"
    echo "zsh-users/zsh-completions kind:fpath path:src"

    echo "romkatv/powerlevel10k"

    if [[ -f "${USER_DEFS}/interactive/antidote.zsh"]]; then
        cat "${USER_DEFS}/interactive/antidote.zsh"
    fi
}

function generate_bundle() {
    local cachefile="${XDG_CACHE_HOME}/antidote/antidote_plugins.zsh"
    zstyle ':antidote:static' file "$cachefile"
    construct_plugins | antidote bundle
}

function setup_antidote() {
    local userfile="${USER_DEFS}/interactive/antidote.zsh"
    local cache="${XDG_CACHE_HOME}/antidote"
    local cachefile="${cache}/antidote_plugins.zsh"

    # Ensure the plugin file exists so you can add plugins.
    [[ -f "$userfile" ]] || touch "$userfile"

    # Ensure the antidote cache dir exists
    [[ -d "$cache" ]] || mkdir -p "$cache"

    # Lazy-load antidote from its functions directory.
    fpath=("${ANTIDOTE_INSTALL}/functions" $fpath)
    autoload -Uz antidote

    # Generate a new static file whenever the user plugin defs is updated.
    if [[ ! "$cachefile" -nt "$userfile" ]]; then
        generate_bundle
    elif [[ ! -z "$ANTIDOTE_FORCE_REBUNDLE" ]]; then
        generate_bundle
    fi

    # Source your static plugins file.
    source $cachefile
}

setup_antidote
unset setup_antidote
