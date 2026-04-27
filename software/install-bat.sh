#!/bin/bash

echo
echo "################################################################"
echo "  Installing bat                                                "
echo "################################################################"
echo

if ! command -v batcat &>/dev/null; then
    sudo apt install -y bat
fi
