export TERM=xterm-256color

export PERSONAL_INSTALL="${HOME}/.local"
export PERSONAL_ETC="${PERSONAL_INSTALL}/etc"
export CARGO_DIR="${HOME}/.cargo"
export NEXUS_USERNAME="CHANGE ME"
export NEXUS_PASSWORD="CHANGE ME"
export HELM_INSTALL="/opt/helm"

toaddtopath=(
	"${PERSONAL_INSTALL}/bin"
	"${CARGO_DIR}/bin"
	"${HELM_INSTALL}/bin"
)

export -u path=("${toaddtopath[@]}" "${path[@]}")
export EDITOR="${VISUAL}"

