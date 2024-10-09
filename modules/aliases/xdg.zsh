if testForCommand xsel; then
    [[ ! -d "${XDG_DATA_HOME}/xsel" ]] && mkdir -p "${XDG_DATA_HOME}/xsel"
    alias xsel="xsel -l ${XDG_DATA_HOME}/xsel/xsel.log"
fi

if testForCommand xbindkeys; then
    [[ ! -d "${XDG_DATA_HOME}/xbindkeys" ]] && mkdir -p "${XDG_DATA_HOME}/xbindkeys"
    alias xbindkeys="xbindkeys -f ${XDG_DATA_HOME}/xbindkeys/rc -fg ${XDG_DATA_HOME}/xbindkeys/rc.scm"
fi
