#!/bin/bash

echo
echo "################################################################"
echo "  Installing Oracle VM VirtualBox                               "
echo "################################################################"
echo

if ! command -v virtualbox &>/dev/null; then
    sudo apt install -y virtualbox
fi
