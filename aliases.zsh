#!/usr/bin/env zsh

alias commitAll="git add .; git commit"
alias dir-sizes="du -sh"

# Uncomment these aliases if you end up using the aliases that uses exa
#alias ls='exa -a --group-directories-first'
#alias ll='ls -l --header'
#alias lgit="ls --git --git-ignore"

# Comment these aliases out if you end up using the aliases that use exa
alias ll='ls -al --color --group-directories-first'
alias la='ls -a --color --group-directories-first'

alias mvn="mvn --settings ${HOME}/.local/etc/m2/settings.xml"

alias copy_to_clipboard='xclip -selection clipboard'
alias listAllRunningContainers='docker container ls -aq'
