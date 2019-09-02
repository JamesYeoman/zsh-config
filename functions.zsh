#!/usr/bin/env zsh

export fpath=(
    "${SHELL_CONF}"/autoload
    "${fpath[@]}"
)

autoload -Uz urandom_filter
autoload -Uz randomchar
autoload -Uz readablepath
autoload -Uz sortedreadablepath

# These are meme ones. As such, they aren't enabled by default 
autoload -Uz spongebob
autoload -Uz vaporwave
