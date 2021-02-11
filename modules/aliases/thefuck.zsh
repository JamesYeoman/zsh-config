# Only enable if user explicitly requests it in the user_defs module
[[ "${FUCK_YEAH}" != 1 ]] && return

# Prevent PIP from outputting warnings during shell initialisation if out of date
qWarning="--disable-pip-version-check"

# requires installing the `thefuck` package with pip on python 3
if testForCommand pyenv && pyenv version-name | grep "3\..*" &>/dev/null; then
    if ! pip "$qWarning" list | grep "thefuck" &> /dev/null; then
        pip "$qWarning" install thefuck
    fi

    eval $("thefuck" --alias)
fi
