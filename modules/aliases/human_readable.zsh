alias commitAll="git add .; git commit"
alias dir-sizes="du -sh"

if testForCommand docker; then
    alias allContainers='docker container ls -aq'
fi

if testForCommand xclip; then
    alias clipboard='xclip -selection clipboard'
fi

