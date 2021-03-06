#!/usr/bin/env bash

echo "This handles migration of clutter files that my ZSH config fixes,"
echo "but if there's missing support for your favourite tools, feel free to make a pull request"
echo "with the XDG support environment variables (if applicable) as per"
echo "https://wiki.archlinux.org/index.php/XDG_Base_Directory"
printf "\n\n"

echo "Press any key to acknowledge the above disclaimer"
read -s

#region functions
function _is_a_directory() {
    [[ -d "$1" ]] && return 0 || return 1
}

function _is_a_file() {
    [[ -f "$1" ]] && return 0 || return 1
}

function _moveIfExists() {
    # $1 is the prefix path (e.g. XDG_DATA_HOME)
    local prefixPath="$1"
    # $2 is the file or directory that needs moving
    local toMove="$2"
    # $3 is the new directory name (name of the parent if $2 is a file) (ignored if $5 is set)
    # (equivalent to $4 if $2 is a directory)
    local newDirectoryName="$3"
    # (optional) $4 is the new name for the file (not used for directories)
    local newFileName="${4:--1}"
    # (optional) $5 indicates that the move requires sudo (currently only used for XDG_RUNTIME_DIR)
    local sudoFlag="${5:--1}"

    # Path of the destination folder
    local newPlace="${prefixPath}/${newDirectoryName}"

    # If the move requires sudo, then the destination folder will be the prefix path
    [[ "${sudoFlag}" -eq -1 ]] || newPlace="${prefixPath}"

    # Files need additional processing before moving
    if _is_a_file "${toMove}" && [[ "${sudoFlag}" -eq -1 ]]; then
        # Make the new folder if it doesn't already exist
        [[ ! -d "${newPlace}" ]] && mkdir -p "${newPlace}"  

        # If no newFileName defined, default to the name of the file to move
        if [[ "${newFileName}" -eq -1 ]]; then
            local filename="$(basename $(realpath ${toMove}))"
            newPlace="${newPlace}/${filename}"
        else
            newPlace="${newPlace}/${newFileName}"
        fi
    elif ! _is_a_directory "${toMove}"; then
        # The file or directory isn't a valid path
        echo "${toMove} doesn't exist in your home directory. Skipping."
        return
    fi

    echo "Moving ${toMove} to $newPlace"
    # Actually move the file or directory
    [[ "${sudoFlag}" -eq -1 ]] && mv "${toMove}" "${newPlace}" || sudo mv "${toMove}" "${newPlace}"
    echo "Successfully moved"

    if _is_a_file "${toMove}"; then
        # Remove the parent directory if this moved file is the final file in the directory
        local parentDir="$(realpath $(dirname ${toMove}))"
        [[ "$(ls -A ${parentDir})" ]] || rm -r "${parentDir}"
        echo "Successfully removed the now empty parent folder of ${parentDir}"
    fi
}

function moveToConfigIfExists() {
    _moveIfExists "${XDG_CONFIG_HOME}" "$1" "$2" "$3"
}

function moveToCacheIfExists() {
    _moveIfExists "${XDG_CACHE_HOME}" "$1" "$2" "$3"
}

function moveToDataIfExists() {
    _moveIfExists "${XDG_DATA_HOME}" "$1" "$2" "$3"
}

function moveToRuntimeIfExists() {
    _moveIfExists "${XDG_RUNTIME_DIR}" "$1" "$2" "$3" "t"
}
#endregion

#region Git
#region files
moveToConfigIfExists "${HOME}/.gitconfig" "git" "config"
moveToConfigIfExists "${HOME}/.gitignore" "git" "ignore"
moveToConfigIfExists "${HOME}/.gitk" "git" "gitk"
#endregion

#region git version specific
gitVersion="$(git --version | sed 's/git version //')"
gitVersionArr="$(IFS='.' read -r -a array <<< "$gitVersion")"

# If git > 2.x or git >= 2.4.x
if [[ "${gitVersionArr[0]}" -gt 2 ]] || ([[ "${gitVersionArr[0]}" -eq 2 ]] && [[ "${gitVersionArr[1]}" -ge 4 ]]); then
    moveToConfigIfExists "${HOME}/.git-credentials" "git" "credentials"
fi
#endregion
#endregion

#region X Utils
#region files
moveToDataIfExists "${HOME}/.xbindkeysrc" "xbindkeys" "rc"
moveToDataIfExists "${HOME}/.xbindkeysrc.scm" "xbindkeys" "rc.scm"
moveToDataIfExists "${HOME}/.xsel.log" "xsel" "xsel.log"
#endregion
#endregion

#region SDK/Language managers
#region envs
moveToDataIfExists "${HOME}/.jenv" "jenv"
moveToDataIfExists "${HOME}/.pyenv" "pyenv"
moveToDataIfExists "${HOME}/.nodenv" "nodenv"
moveToDataIfExists "${HOME}/.sbtenv" "sbtenv"
moveToDataIfExists "${HOME}/.scalaenv" "scalaenv"
moveToDataIfExists "${HOME}/.goenv" "goenv"
moveToDataIfExists "${HOME}/.rbenv" "rbenv"

#endregion
#region rust
moveToDataIfExists "${HOME}/.cargo" "cargo"
moveToDataIfExists "${HOME}/.rustup" "rustup"
#endregion
#endregion

#region misc config
#region files
moveToConfigIfExists "${HOME}/.npmrc" "npm" "npmrc"
#endregion

#region directories
moveToConfigIfExists "${HOME}/.gnupg" "gnupg"
moveToConfigIfExists "${HOME}/.docker" "docker"
#endregion
#endregion

#region misc cache
#region directories
moveToCacheIfExists "${HOME}/nv" "nv"
moveToCacheIfExists "${HOME}/.npm" "npm"
moveToCacheIfExists "${HOME}/.sonar" "sonar"
moveToCacheIfExists "${HOME}/.sonarlint" "sonarlint"
moveToCacheIfExists "${HOME}/.antigen" "antigen"
#endregion
#endregion

#region misc data
#region files
moveToDataIfExists "${HOME}/.lesshst" "less" "history"
moveToDataIfExists "${HOME}/.mysql_history" "mysql" "history"
#endregion

#region directories
moveToDataIfExists "${HOME}/.gradle" "gradle"
moveToDataIfExists "${HOME}/.docker/machine" "docker-machine"
moveToDataIfExists "${HOME}/.racket" "racket" 
moveToDataIfExists "${HOME}/go" "go"
#endregion
#endregion

#region misc runtime
#region files
moveToRuntimeIfExists "${HOME}/.ICEauthority" "" "ICEAuthority"
moveToRuntimeIfExists "${HOME}/.Xauthority" "" "XAuthority"
#endregion
#endregion
