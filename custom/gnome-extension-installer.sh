#!/bin/bash

echo
echo "################################################################"
echo "  Installing gnome extension installer                        "
echo "################################################################"
echo

if ! location=$(type -p "gnome-shell-extension-installer"); then
    wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
    chmod +x gnome-shell-extension-installer
    sudo mv gnome-shell-extension-installer /usr/bin/
fi
