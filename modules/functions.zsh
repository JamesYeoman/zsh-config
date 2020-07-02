export fpath=(
    "${ZDOTDIR}"/autoload
    "${fpath[@]}"
)

for file in "${ZDOTDIR}/autoload"/**/*(.); do
    autoload -Uz $(basename $file)
done

