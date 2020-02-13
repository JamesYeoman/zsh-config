# requires installing the `thefuck` package with pip on python 3
if testCommand pyenv && pyenv version-name | grep "3\..*" &>/dev/null; then
    if pip list | grep "thefuck" &> /dev/null; then
        eval $("thefuck" --alias)
    fi
fi

alias commitAll="git add .; git commit"
alias dir-sizes="du -sh"

# Uncomment these aliases if you end up using the aliases that uses exa
#alias ll='exa -al --group-directories-first'
#alias llh='ll --header'
#alias lgit="ll --git --git-ignore"

# Comment these aliases out if you end up using the aliases that use exa
alias ll='ls -al --color --group-directories-first'
alias la='ls -a --color --group-directories-first'

alias mvn="mvn --settings ${HOME}/.local/etc/m2/settings.xml"

alias copy_to_clipboard='xclip -selection clipboard'
alias listAllRunningContainers='docker container ls -aq'
