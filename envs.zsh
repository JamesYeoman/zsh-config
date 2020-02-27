ENV_COMMANDS=("jenv" "pyenv" "nodenv" "sbtenv" "scalaenv" "goenv")
RUST_COMMANDS=("cargo" "rustup")

for cmnd in $ENV_COMMANDS; do
    dynamicExportIfExists "${PERSONAL_ETC}" "${cmnd}" "_ROOT"
done

for cmnd in $RUST_COMMANDS; do
    dynamicExportIfExists "${PERSONAL_ETC}" "${cmnd}" "_HOME"
done

export -U PATH

for cmnd in $ENV_COMMANDS; do
    if testForCommand "$cmnd"; then
        eval "$("$cmnd" init - zsh)" || eval "$("$cmnd" init -)"
    fi
done
