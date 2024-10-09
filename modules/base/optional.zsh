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

NEXUS_CREDS_LOC="${HOME}/.local/etc/dynamic/nexus"
if [ -f "${NEXUS_CREDS_LOC}/username" ] && [ -f "${NEXUS_CREDS_LOC}/password" ]; then
	export NEXUS_USERNAME="$(cat ${NEXUS_CREDS_LOC}/username)"
	export NEXUS_PASSWORD="$(cat ${NEXUS_CREDS_LOC}/password)"
fi