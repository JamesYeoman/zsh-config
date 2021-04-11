verboseLog "Ensuring everything is up to date"
sudo apt-get update -qq && sudo apt-get upgrade -qqy

toInstall=(
    "curl" "build-essential" "apt-transport-https" "ca-certificates"
    "gnupg-agent" "software-properties-common" "xclip" "lsb-release"
    "nano" "vim" "neofetch" "unzip"
)

verboseLog "Ensuring the following core debian deps are installed:"

for dep in "${toInstall[@]}"; do
    commentDep="${dep}"
    case $dep in
    neofetch)
        commentDep="neofetch (because who doesn't want to occasionally show off their system)"
        ;;
    nano)
        commentDep="nano (for those that just want a simple CLI text editor) (set as the default editor)"
        ;;
    vim)
        commentDep="vim (for those that prefer or are used to vim)"
	;;
    esac
    printf "\t${commentDep}\n"
done

sudo apt-get -qqy install "${toInstall[@]}"
