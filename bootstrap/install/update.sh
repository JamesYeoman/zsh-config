#!/usr/bin/env bash
FOLDER="$(realpath $(dirname $0))"
verboseLog() {
    bash -c "${FOLDER}/verboseLog.sh \"$1\""
}

verboseLog "Ensuring everything is up to date"
sudo apt-get update -qq && sudo apt-get upgrade -qqy

toInstall=(
    "curl" "build-essential" "apt-transport-https" "ca-certificates"
    "gnupg-agent" "software-properties-common" "xclip"
)

verboseLog "Ensuring base debian deps are installed"
sudo apt-get -qqy install "${toInstall[@]}"
