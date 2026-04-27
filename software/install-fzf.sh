#!/bin/bash

echo
echo "################################################################"
echo "  Installing fzf                                                "
echo "################################################################"
echo

if ! command -v fzf &>/dev/null; then
    sudo apt install -y fzf
fi
