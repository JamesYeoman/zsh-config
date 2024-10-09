# Prepend the user's local bin folder in order to take precedence
path=("$BIN_HOME" $path)

if [[ -d "/usr/lib/google-cloud-sdk" ]]; then
    export CLOUDSDK_HOME="/usr/lib/google-cloud-sdk"
fi

if [[ -d "/opt/helm" ]]; then
    export HELM_INSTALL="/opt/helm"
fi

if [[ -d "${XDG_DATA_HOME}/rustup" ]]; then
    export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
fi

if [[ -d "${XDG_DATA_HOME}/cargo" ]]; then
    export CARGO_HOME="${XDG_DATA_HOME}/cargo"
fi

if (( ${+HELM_INSTALL} )); then
    path+="${HELM_INSTALL}/bin"
fi

if (( ${+CARGO_HOME} )); then
    path+="${CARGO_HOME}/bin"
fi

# Exports PATH, removing duplicates
export -U path 
