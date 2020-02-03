export fpath=(
    "${SHELL_CONF}"/autoload
    "${fpath[@]}"
)

for file in "${SHELL_CONF}/autoload"/**/*(.); do
    autoload -Uz $(basename $file)
done

