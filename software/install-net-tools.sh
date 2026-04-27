#!/bin/bash

echo
echo "################################################################"
echo "  Installing net-tools                                          "
echo "################################################################"
echo

if ! dpkg -l net-tools &>/dev/null; then
    sudo apt install -y net-tools
fi
