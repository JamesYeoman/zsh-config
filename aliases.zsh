#!/usr/bin/env zsh

alias commitAll="git add .; git commit"
alias dir-sizes="du -sh"

#Comment this alias out if you end up using the aliases that uses exa
alias ls='exa -a --group-directories-first'
alias ll='ls -l --header'
alias lgit="ls --git --git-ignore"

alias mvn="mvn --settings ${HOME}/.local/etc/m2/settings.xml"

alias copy_to_clipboard='xclip -selection clipboard'

#alias trash='gio trash'

alias listAllRunningContainers='docker container ls -aq'
