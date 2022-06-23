function getDistroName() {
    if ! command -v lsb_release &>/dev/null; then
        echo "unknown"
        return
    fi

    case "$(lsb_release -is)" in
    "Linuxmint")
        grep 'DISTRIB_CODENAME' /etc/upstream-release/lsb-release | awk -F '=' '{print $2}'
        ;;
    *)
        lsb_release -cs
        ;;
    esac
}
