alias ll='ls -al --color --group-directories-first'
alias la='ls -a --color --group-directories-first'

if (( ${+CARGO_HOME} )) && [ -f "${CARGO_HOME}/bin/exa" ]; then
    alias ela='exa -al --group-directories-first'
    alias elh='ela --header'
    alias elg="elh --git --git-ignore"
fi

