#!/usr/bin/env bash
BOOTSTRAP="${ZDOTDIR}/bootstrap"
bash "${BOOTSTRAP}/update.sh"
bash "${BOOTSTRAP}/config.sh"

bash "${ZDOTDIR}/prerequisites/install_prerequisites.sh"
echo "Please restart your machine in order to ensure the zshenv file gets loaded properly (because I don't know exactly the load rules for the zshenv file, but rebooting makes sure it gets loaded"
