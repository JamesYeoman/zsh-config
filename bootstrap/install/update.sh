verboseLog "Ensuring everything is up to date"
sudo apt-get update -qq && sudo apt-get upgrade -qqy

toInstall=(
    "curl" "build-essential" "apt-transport-https" "ca-certificates"
    "gnupg-agent" "software-properties-common" "xclip" "lsb-release"
    "nano" "vim" "neofetch" "unzip" "zsh"
)

verboseLog "Ensuring the following core debian deps are installed:"

for dep in "${toInstall[@]}"; do
    commentDep="$dep"
    case $dep in
    zsh)
        commentDep="zsh (what's the point of a ZSH configuration without ZSH?)"
        ;;
    neofetch)
        commentDep="neofetch (prints some useful information)"
        ;;
    nano)
        commentDep="nano (for those that just want a simple CLI text editor) (set as the default editor)"
        ;;
    vim)
        commentDep="vim (for those that prefer or are used to vim)"
        ;;
    esac
    verboseLog "\t$commentDep"
done

sudo apt-get -qqy install "${toInstall[@]}"
