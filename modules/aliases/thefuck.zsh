# Only enable if user explicitly requests it in the user_defs module
[[ "${FUCK_YEAH}" != 1 ]] && return

# requires installing the `thefuck` package with pip on python 3
if testForCommand pyenv && pyenv version-name | grep "3\..*" &>/dev/null; then
    if ! pip list | grep "thefuck" &> /dev/null; then
        pip install thefuck
    fi

    eval $("thefuck" --alias)
fi
