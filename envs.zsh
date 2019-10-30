ENV_COMMANDS=("jenv" "pyenv" "nodenv" "sbtenv")
getPath() {
    printf "${PERSONAL_ETC}/${1}/bin"
}

for cmnd in $ENV_COMMANDS; do
    path=("$(getPath "$cmnd")" "${path[@]}")
done

export -u path 

for cmnd in $ENV_COMMANDS; do
    if testForCommand $cmnd; then
        eval "$("$cmnd" init -)"
    fi
done

