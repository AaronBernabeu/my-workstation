#!/bin/bash

echo
echo "################################################################"
echo "  Installing Fastfetch                                          "
echo "################################################################"
echo

if ! command -v fastfetch &>/dev/null; then
    sudo apt install -y fastfetch
fi
