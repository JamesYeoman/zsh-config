export PERSONAL_INSTALL="${HOME}/.local"
export PERSONAL_ETC="${PERSONAL_INSTALL}/etc"

export NEXUS_CREDS_LOC="${PERSONAL_ETC}/dynamic/nexus"

export MY_BIN="${PERSONAL_INSTALL}/bin"
export M2_HOME="${PERSONAL_ETC}/m2"

[[ ! -d "${MY_BIN}" ]] && mkdir -p "${MY_BIN}"
[[ ! -d "${M2_HOME}" ]] && mkdir -p "${M2_HOME}"
[[ ! -d "${NEXUS_CREDS_LOC}" ]] && mkdir -p "${NEXUS_CREDS_LOC}"
[[ ! -f "${NEXUS_CREDS_LOC}/username" ]] && touch "${NEXUS_CREDS_LOC}/username"
[[ ! -f "${NEXUS_CREDS_LOC}/password" ]] && touch "${NEXUS_CREDS_LOC}/password"

export NEXUS_USERNAME="$(cat ${NEXUS_CREDS_LOC}/username)"
export NEXUS_PASSWORD="$(cat ${NEXUS_CREDS_LOC}/password)"
export HELM_INSTALL="/opt/helm"
export GOBIN="${PERSONAL_INSTALL}/go/bin"

toaddtopath=(
	"${MY_BIN}"
	"${HELM_INSTALL}/bin"
	"${GOBIN}"
)

export -U path=("${toaddtopath[@]}" "${path[@]}")
