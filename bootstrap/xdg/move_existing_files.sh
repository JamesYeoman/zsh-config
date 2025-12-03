#!/usr/bin/env bash

FG_RED="$(tput setaf 1)"
FG_CYAN="$(tput setaf 6)"
BG_BLACK="$(tput setab 0)"
ALL_RESET="$(tput sgr0)"

echo "${BG_BLACK}${FG_RED}This handles migration of clutter files that my ZSH config fixes,"
echo "but if there's missing support for your favourite tools, feel free to make a pull request"
echo "with the XDG support environment variables (if applicable) as per"
echo "https://wiki.archlinux.org/index.php/XDG_Base_Directory $ALL_RESET"
printf "\n\n"

echo "${BG_BLACK}${FG_CYAN}Press any key to acknowledge the above disclaimer$ALL_RESET"
read -s

#region functions

# $1 is the prefix path (e.g. XDG_DATA_HOME)
#   - if $5 is set, this is the destination folder
# $2 is the file or directory that needs moving
# $3 is the new directory name
#   - name of the parent if $2 is a file
#   - equivalent to $4 if $2 is a directory
#   - ignored if $5 is set
# $4 is the new name for the file
#   - optional
#   - not used for directories
# $5 indicates that the move requires sudo
#   - optional
#   - currently only used for XDG_RUNTIME_DIR
function _moveIfExists() {
    local prefixPath="$1"
    local toMove="$2"
    local newDirectoryName="$3"
    local newFileName="$4"
    local sudoFlag="$5"
    
    if [[ ! -e "$toMove" ]]; then
        echo "${toMove} doesn't exist in your home directory. Skipping."
        return
    fi

    local newPlace="${prefixPath}/$newDirectoryName"

    if [[ -n "$sudoFlag" ]]; then
        newPlace="$prefixPath"
    elif [[ -f "$toMove" ]]; then # Non-sudo files need additional processing before moving
        if [[ ! -d "$newPlace" ]]; then
            mkdir -p "$newPlace"
        fi

        if [[ -n "$newFileName" ]]; then
            newPlace="${newPlace}/$newFileName"
        else
            local filename="$(basename $(realpath $toMove))"
            newPlace="${newPlace}/$filename"
        fi
    fi

    echo "Moving ${toMove} to $newPlace"
    if [[ -n "$sudoFlag" ]]; then
        sudo mv "$toMove" "$newPlace"
    else
        mv "$toMove" "$newPlace"
    fi
    echo "Successfully moved"

    if [[ -f "$toMove" ]]; then
        # Remove the parent directory if this moved file is the final file in the directory
        local parentDir="$(realpath $(dirname ${toMove}))"
        [[ "$(ls -A $parentDir)" ]] || rm -r "$parentDir"
        echo "Successfully removed the now empty parent folder of $parentDir"
    fi
}

function moveToConfigIfExists() {
    _moveIfExists "${XDG_CONFIG_HOME:-${HOME}/.config}" "$1" "$2" "$3"
}

function moveToCacheIfExists() {
    _moveIfExists "${XDG_CACHE_HOME:-${HOME}/.cache}" "$1" "$2" "$3"
}

function moveToDataIfExists() {
    _moveIfExists "${XDG_DATA_HOME:-${HOME}/.local/share}" "$1" "$2" "$3"
}

function moveToRuntimeIfExists() {
    _moveIfExists "$XDG_RUNTIME_DIR" "$1" "$2" "$3" "t"
}

function sectionHeader() {
    echo ""
    for header in "$@"; do
    echo "${BG_BLACK}${FG_CYAN}===== ${header} =====$ALL_RESET"
    done
    echo ""
}
#endregion

#region Git
sectionHeader "Git" "Files"
#region files
moveToConfigIfExists "${HOME}/.gitconfig" "git" "config"
moveToConfigIfExists "${HOME}/.gitignore" "git" "ignore"
moveToConfigIfExists "${HOME}/.gitk" "git" "gitk"
#endregion

sectionHeader "End Files" "Version Specific"

#region git version specific
gitVersion="$(git --version | sed 's/git version //')"
gitVersionArr="$(IFS='.' read -r -a array <<<"$gitVersion")"

# If git > 2.x or git >= 2.4.x
if [[ "${gitVersionArr[0]}" -gt 2 ]] || ([[ "${gitVersionArr[0]}" -eq 2 ]] && [[ "${gitVersionArr[1]}" -ge 4 ]]); then
    moveToConfigIfExists "${HOME}/.git-credentials" "git" "credentials"
fi
#endregion
sectionHeader "End Version Specific" "End Git"
#endregion


#region X Utils
sectionHeader "X Utils" "Files"
#region files
moveToDataIfExists "${HOME}/.xbindkeysrc" "xbindkeys" "rc"
moveToDataIfExists "${HOME}/.xbindkeysrc.scm" "xbindkeys" "rc.scm"
moveToDataIfExists "${HOME}/.xsel.log" "xsel" "xsel.log"
#endregion
sectionHeader "End Files" "End X Utils"
#endregion

#region SDK/Language managers
sectionHeader "SDK/Language Managers" "Envs"

#region envs
moveToDataIfExists "${HOME}/.asdf" "asdf"
moveToDataIfExists "${HOME}/.jenv" "jenv"
moveToDataIfExists "${HOME}/.pyenv" "pyenv"
moveToDataIfExists "${HOME}/.nodenv" "nodenv"
moveToDataIfExists "${HOME}/.sbtenv" "sbtenv"
moveToDataIfExists "${HOME}/.scalaenv" "scalaenv"
moveToDataIfExists "${HOME}/.goenv" "goenv"
moveToDataIfExists "${HOME}/.rbenv" "rbenv"
#endregion

sectionHeader "End Envs" "Rust"

#region rust
moveToDataIfExists "${HOME}/.cargo" "cargo"
moveToDataIfExists "${HOME}/.rustup" "rustup"
#endregion
sectionHeader "End Rust" "End SDK/Language Managers"
#endregion

#region misc config
sectionHeader "Misc Config" "Files"
#region files
moveToConfigIfExists "${HOME}/.npmrc" "npm" "npmrc"
moveToConfigIfExists "${HOME}/.vimrc" "vim" "vimrc"
moveToConfigIfExists "${HOME}/.viminfo" "vim" "viminfo"
#endregion

sectionHeader "End Files" "Directories"

#region directories
if [[ -d "${HOME}/.vim" ]]; then
    for vimitem in "$HOME"/.vim/*; do
        moveToConfigIfExists "$vimitem" "vim" "$(basename $vimitem)"
    done
fi
moveToConfigIfExists "${HOME}/.gnupg" "gnupg"
moveToConfigIfExists "${HOME}/.docker" "docker"
#endregion
sectionHeader "End Directories" "End Misc Config"
#endregion


#region misc cache
sectionHeader "Misc Cache" "Directories"
#region directories
moveToCacheIfExists "${HOME}/nv" "nv"
moveToCacheIfExists "${HOME}/.npm" "npm"
moveToCacheIfExists "${HOME}/.sonar" "sonar"
moveToCacheIfExists "${HOME}/.sonarlint" "sonarlint"
moveToCacheIfExists "${HOME}/.antigen" "antigen"
sectionHeader "End Directories" "End Misc Cache"
#endregion
#endregion

#region misc data
sectionHeader "Misc Data" "Files"
#region files
moveToDataIfExists "${HOME}/.lesshst" "less" "history"
moveToDataIfExists "${HOME}/.mysql_history" "mysql" "history"
moveToDataIfExists "${HOME}/.bash_history" "bash" "history"
moveToDataIfExists "${HOME}/.zsh_history" "zsh" "history"
sectionHeader "End Files" "Directories"
#endregion

#region directories
moveToDataIfExists "${HOME}/.gradle" "gradle"
moveToDataIfExists "${HOME}/.docker/machine" "docker-machine"
moveToDataIfExists "${HOME}/.racket" "racket"
moveToDataIfExists "${HOME}/go" "go"
sectionHeader "End Directories" "End Misc Data"
#endregion
#endregion

#region misc runtime
sectionHeader "Misc Runtime" "Files"
#region files
moveToRuntimeIfExists "${HOME}/.ICEauthority" "" "ICEAuthority"
moveToRuntimeIfExists "${HOME}/.Xauthority" "" "XAuthority"
sectionHeader "End Files" "End Misc Runtime"
#endregion
#endregion
