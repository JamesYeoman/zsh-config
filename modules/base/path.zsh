# Prepend the user's local bin folder in order to take precedence
path=("$BIN_HOME" $path)

if (( ${+HELM_INSTALL} )); then
    path+="${HELM_INSTALL}/bin"
fi

if (( ${+CARGO_HOME} )); then
    path+="${CARGO_HOME}/bin"
fi

# Exports PATH, removing duplicates
export -U path 
