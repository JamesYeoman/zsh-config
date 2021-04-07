ENV_COMMANDS=("jenv" "pyenv" "nodenv" "sbtenv" "scalaenv" "goenv" "rbenv")
RUST_COMMANDS=("cargo" "rustup")

for cmnd in $ENV_COMMANDS; do
    dynamicExportIfExists "${XDG_DATA_HOME}" "${cmnd}" "_ROOT"
done

for cmnd in $RUST_COMMANDS; do
    dynamicExportIfExists "${XDG_DATA_HOME}" "${cmnd}" "_HOME"
done

export -U PATH

for cmnd in $ENV_COMMANDS; do
    if testForCommand "$cmnd"; then
        eval "$("$cmnd" init - zsh)" || eval "$("$cmnd" init -)"
    fi
done
