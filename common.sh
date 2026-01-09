#!/usr/bin/env bash
# vim: expandtab tabstop=4 shiftwidth=4

good() {
    echo -e "\033[32m[$(date +"%H:%M:%S:%2N")] [INFO] $1\033[0m"
}

info() {
    echo "[$(date +"%H:%M:%S:%2N")] [INFO] $1"
}

warn() {
    echo -e "\033[33m[$(date +"%H:%M:%S:%2N")] [WARN] $1\033[0m"
}

err() {
    echo -e "\033[31m[$(date +"%H:%M:%S:%2N")] [ERROR] $1\033[0m"
}

confirm() {
    read -rp "$1
Press Y to confirm, press any other keys to cancel: " val
    case "$val" in
        Y|y|yes|Yes) : ;;
        *) return 69 ;;
    esac
}
