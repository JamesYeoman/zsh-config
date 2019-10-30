ENV_COMMANDS=( jenv pyenv nodenv sbtenv )
TOADDTOPATH=()
function addToPath() {
    return ( "${PERSONAL_ETC}/${1}/bin" "${path[@]}" )
}

for cmnd in $ENV_COMMANDS; do
    path=$(addToPath $cmnd)
done

export -u path 

for cmnd in $ENV_COMMANDS; do
    if testForCommand $cmnd; then
        eval "$("$cmnd" init -)"
    fi
done

