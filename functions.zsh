#!/usr/bin/env zsh

export fpath=(
    "${SHELL_CONF}"/autoload
    "${fpath[@]}"
)

autoload -Uz urandom_filter
autoload -Uz randomchar
autoload -Uz readablepath
autoload -Uz sortedreadablepath
autoload -Uz installzshfont

