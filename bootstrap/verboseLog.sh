#!/usr/bin/env bash
BOOTSTRAP="$(dirname $0)"

[[ -f "${BOOTSTRAP}/verbose" ]] && echo "$1"
