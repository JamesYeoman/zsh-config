export TERM=xterm-256color

export PERSONAL_INSTALL="${HOME}/.local"
export PERSONAL_ETC="${PERSONAL_INSTALL}/etc"
export CARGO_DIR="${HOME}/.cargo"
export PYENV_ROOT="${PERSONAL_INSTALL}/etc/pyenv"
export JENV_ROOT="${PERSONAL_INSTALL}/etc/jenv"
export NODENV_ROOT="${PERSONAL_ETC}/nodenv"
#export NEXUS_USERNAME="REPLACE ME"
#export NEXUS_PASSWORD="REPLACE ME"
export HELM_INSTALL="/opt/helm"

toaddtopath=(
	"${PERSONAL_INSTALL}/bin"
	"${CARGO_DIR}/bin"
	"${HELM_INSTALL}/bin"
)

export -u path=("${toaddtopath[@]}" "${path[@]}")
export EDITOR="${VISUAL}"

