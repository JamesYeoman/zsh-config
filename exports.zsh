#This is to allow the themes to be able to display the correct name in the prompt
export DEFAULT_USER="$(whoami)"

# Sets the window to just the current directory
export DISABLE_AUTO_TITLE="true"

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

# The default size of the history file is so damn small. Let's fix that
export HISTSIZE=100000
export HISTFILESIZE=100000

# Just as a nice addition. Personal taste and all that
export COMPLETION_WAITING_DOTS="true"

# ISO FORMAT!!!!! WOOP!!!!!
export HIST_STAMPS="yyyy-mm-dd"

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
export EDITOR="${VISUAL}"
