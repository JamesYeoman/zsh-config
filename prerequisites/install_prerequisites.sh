#!/usr/bin/env bash

SCRIPTPATH="$(realpath "$(dirname "$0")")/scripts"
startOfSection() {
	printf "Installing ${1}\n"
}

endOfSection() {
	printf "Done\n\n"
}

startOfSection "Antigen to /usr/local/share/antigen"
bash "${SCRIPTPATH}/antigen.sh"
endOfSection

startOfSection "a font that has the required glyphs for the zsh theme"
bash "${SCRIPTPATH}/zshfont.sh"
endOfSection
