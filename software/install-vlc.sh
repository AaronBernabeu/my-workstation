#!/bin/bash

echo
echo "################################################################"
echo "  Installing VLC media player                                   "
echo "################################################################"
echo

if ! command -v vlc &>/dev/null; then
    sudo apt install -y vlc
fi
