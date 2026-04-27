#!/bin/bash

echo
echo "################################################################"
echo "  Installing Diodon                                             "
echo "################################################################"
echo

if ! command -v diodon &>/dev/null; then
    sudo apt install -y diodon
fi
