path+="$BIN_HOME"

if (( ${+HELM_INSTALL} )); then
    path+="${HELM_INSTALL}/bin"
fi

if (( ${+CARGO_HOME} )); then
    path+="${CARGO_HOME}/bin"
fi

# Exports PATH, removing duplicates
export -U path 
