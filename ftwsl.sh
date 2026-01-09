#!/bin/bash

. common.sh

if [ "$EUID" -ne 0 ]; then
  echo "please run as root (use sudo or switch to root user)."
  exit 1
fi

KERNEL_VERSION=$(uname -r)

clear
echo '
  / _| |___      _____| |
 | |_| __\ \ /\ / / __| |
 |  _| |_ \ V  V /\__ \ |
 |_|  \__| \_/\_/ |___/_|
'
echo "WARNING: MUST BE USED ON A FRESH FEDORA INSTALL WITH INTERNET ACCESS!"
echo "This script modifies system configurations. Run at your own risk."
echo ""

if [[ -f /data/data/com.termux/files/usr/bin/termux-setup-storage ]]; then
    warn "Termux environment detected!"
    warn "Termux not supported!"
fi

if [[ $OSTYPE == 'darwin'* ]]; then
    warn "macOS environment detected!"
    warn "macOS not supported!"
fi

if [ ! -f /proc/sys/fs/binfmt_misc/WSLInterop* ]; then
    err "WSL enviroment not found! Please use standard Fedora Tweaks!"
    exit 1
fi

echo "Accepting the terms above, do you still wish to run the script?"
echo "You will be asked Yes/No for each individual feature."
read -p "Type 'yes' to continue, or anything else to exit: " yn
case $yn in
    [Yy]* ) ;;
    * ) exit;;
esac

function ask_and_run() {
    local description="$1"
    local function_name="$2"
    
    echo "------------------------------------------------"
    read -p "[?] apply tweak: $description? [y/N]: " choice
    case "$choice" in 
        [yY][eE][sS]|[yY]) 
            echo ">> [!] applying: $description..."
            $function_name
            ;;
        *) 
            echo ">> [...] skipped tweak: $description."
            ;;
    esac
    echo ""
}

function tweak_dnf() {
    if ! grep -q "max_parallel_downloads" /etc/dnf/dnf.conf; then
        echo 'max_parallel_downloads=10' | tee -a /etc/dnf/dnf.conf
    fi
    if ! grep -q "fastestmirror" /etc/dnf/dnf.conf; then
        echo 'fastestmirror=true' | tee -a /etc/dnf/dnf.conf
    fi
    echo "[!] speeded up dnf."
}

function update_system() {
    dnf update -y
    dnf upgrade --refresh -y
    dnf check-update -y
}

function install_repos() {
    dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    
    dnf groupupdate core -y
    
    dnf install dnf-plugins-core -y
    dnf copr enable dawid/better_fonts -y
}

echo ""
echo "starting configuration wizard..."

ask_and_run "edit dnf configuration" tweak_dnf

ask_and_run "install RPM Fusion & Better Fonts repositories" install_repos

ask_and_run "apply system tweaks" system_tweaks

echo '
The tweaks are done! Thanks for using my project! 
NOTICE: If you have an NVIDIA card, please visit https://rpmfusion.org/Howto/NVIDIA manually.
'
echo 'Follow owner of Fedora Tweaks on github! https://github.com/rockenman1234'
echo 'ftwsl # explore the newer features'
echo 'It is imperative to reboot as soon as possible!!!'
