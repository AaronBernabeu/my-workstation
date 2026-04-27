#!/bin/bash

echo
echo "################################################################"
echo "  Installing eza                                                "
echo "################################################################"
echo

if ! command -v eza &>/dev/null; then
    sudo apt install -y eza
fi
