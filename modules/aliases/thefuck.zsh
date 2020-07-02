# requires installing the `thefuck` package with pip on python 3
if testForCommand pyenv && pyenv version-name | grep "3\..*" &>/dev/null; then
    if pip list | grep "thefuck" &> /dev/null; then
        eval $("thefuck" --alias)
    fi
fi
