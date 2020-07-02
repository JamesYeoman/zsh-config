# requires installing the `thefuck` package with pip on python 3
if testForCommand pyenv && pyenv version-name | grep "3\..*" &>/dev/null; then
    if pip list | grep "thefuck" &> /dev/null; then
        eval $("thefuck" --alias)
    fi
fi

alias commitAll="git add .; git commit"
alias dir-sizes="du -sh"

# Uncomment these aliases if you end up using the aliases that uses exa
alias ela='exa -al --group-directories-first'
alias elh='ela --header'
alias elg="elh --git --git-ignore"

# Comment these aliases out if you end up using the aliases that use exa
alias ll='ls -al --color --group-directories-first'
alias la='ls -a --color --group-directories-first'

alias copy_to_clipboard='xclip -selection clipboard'
alias allDocker='docker container ls -aq'
