# Installs Rustup in an xdg-compliant fashion

source "${INSTALLER_ROOT}/utils/ensure-xdg-folders-exist.sh"

export RUSTUP_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/rustup"
export CARGO_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/cargo"

curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh -s -- --no-modify-path
