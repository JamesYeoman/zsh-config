#This is to allow the themes to be able to display the correct name in the prompt
export DEFAULT_USER="$(whoami)"

# Sets the window to just the current directory
export DISABLE_AUTO_TITLE="true"

export PERSONAL_INSTALL="${HOME}/.local"
export PERSONAL_ETC="${PERSONAL_INSTALL}/etc"

export MY_BIN="${PERSONAL_INSTALL}/bin"
export M2_HOME="${HOME}/.local/etc/m2"

[[ ! -d "${MY_BIN}" ]] && mkdir -p "${MY_BIN}"
[[ ! -d "${M2_HOME}" ]] && mkdir -p "${M2_HOME}"

# The default size of the history file is so damn small. Let's fix that
export HISTSIZE=100000
export HISTFILESIZE=100000

# Just as a nice addition. Personal taste and all that
export COMPLETION_WAITING_DOTS="true"

# ISO FORMAT!!!!! WOOP!!!!!
export HIST_STAMPS="yyyy-mm-dd"

export NEXUS_USERNAME="CHANGE ME"
export NEXUS_PASSWORD="CHANGE ME"
export HELM_INSTALL="/opt/helm"
export GOBIN="${PERSONAL_INSTALL}/go/bin"

toaddtopath=(
	"${MY_BIN}"
	"${HELM_INSTALL}/bin"
	"${GOBIN}"
)

export -U path=("${toaddtopath[@]}" "${path[@]}")
export EDITOR="${VISUAL}"
