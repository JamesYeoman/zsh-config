function exportVarIfExists() {
    if [[ -d "$2" ]]; then
        eval "export ${1}=\"${2}\""
    fi
}

exportVarIfExists "CLOUDSDK_HOME" "/usr/lib/google-cloud-sdk"
exportVarIfExists "HELM_INSTALL" "/opt/helm"
exportVarIfExists "RUSTUP_HOME" "${XDG_DATA_HOME}/rustup"
exportVarIfExists "CARGO_HOME" "${XDG_DATA_HOME}/cargo"

unset exportVarIfExists
