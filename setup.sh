#!/bin/bash

# Fail immediately if any errors occur
set -e

echo
echo "################################################################"
echo "  Setup Workstation                                             "
echo "################################################################"
echo

echo "Caching [sudo] password..."
sudo -K
sudo true;

echo
echo "################################################################"
echo "  Updating the system                                           "
echo "################################################################"
echo

# Upgrade
sudo apt update
sudo apt full-upgrade -y

echo
echo "################################################################"
echo "  Installing requirements for repositories                      "
echo "################################################################"
echo

# Required to add repositories
sudo apt install -y \
    ca-certificates \
    apt-transport-https \
    software-properties-common

# Software installation
./software/uninstall-applications-by-default.sh
./software/install-ubuntu-restricted-extras.sh
./software/install-gnome-applications.sh
./software/install-traceroute.sh
./software/install-curl.sh
./software/install-unrar.sh
./software/install-htop.sh
./software/install-screenfetch.sh
./software/install-sensors.sh
./software/install-docker.sh
./software/install-google-chrome.sh
./software/install-filezilla.sh
./software/install-vlc.sh
./software/install-git.sh
./software/install-telegram.sh
./software/install-slack.sh
./software/install-k9s.sh
./software/install-fzf.sh
./software/install-jetbrains-toolbox.sh
./software/install-virtualbox.sh
./software/install-zsh.sh
./software/install-diodon.sh

# Custom config
./custom/gnome-extension-installer.sh
./custom/gtile-gnome-shell-extension.sh
./custom/install-dotfiles.sh

echo
echo "################################################################"
echo "  Updating the system                                           "
echo "################################################################"
echo

# Upgrade
sudo apt update
sudo apt --fix-broken install
sudo apt upgrade -y
sudo apt autoremove -y
