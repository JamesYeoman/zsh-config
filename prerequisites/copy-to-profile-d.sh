#!/usr/bin/env sh

for file in "$(realpath $(dirname $0))/profile.d"/*; do
    local filename="$(basename $file)"
    [[ ! -f "/etc/profile.d/${filename}" ]] && sudo ln -s "$(realpath $file)" "/etc/profile.d/${filename}"
done
