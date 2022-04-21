for xenv in $XENV_COMMANDS; do
    eval "$("$xenv" init - --no-rehash)"
done
