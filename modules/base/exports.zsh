export NEXUS_CREDS_LOC="${HOME_ROOT}/etc/dynamic/nexus"

[[ ! -d "${HOME_ROOT}/bin" ]] && mkdir -p "${HOME_ROOT}/bin"
[[ ! -d "${NEXUS_CREDS_LOC}" ]] && mkdir -p "${NEXUS_CREDS_LOC}"
[[ ! -f "${NEXUS_CREDS_LOC}/username" ]] && touch "${NEXUS_CREDS_LOC}/username"
[[ ! -f "${NEXUS_CREDS_LOC}/password" ]] && touch "${NEXUS_CREDS_LOC}/password"

export NEXUS_USERNAME="$(cat ${NEXUS_CREDS_LOC}/username)"
export NEXUS_PASSWORD="$(cat ${NEXUS_CREDS_LOC}/password)"
export HELM_INSTALL="/opt/helm"
export GOBIN="${XDG_DATA_HOME}/go/bin"

toaddtopath=(
	"${HOME_ROOT}/bin"
	"${HELM_INSTALL}/bin"
	"${GOBIN}"
)

export -U path=("${toaddtopath[@]}" "${path[@]}")
