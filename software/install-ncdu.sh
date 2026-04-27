#!/bin/bash

echo
echo "################################################################"
echo "  Installing Ncdu                                               "
echo "################################################################"
echo

if ! command -v ncdu &>/dev/null; then
    sudo apt install -y ncdu
fi
