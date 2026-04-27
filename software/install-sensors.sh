#!/bin/bash

echo
echo "################################################################"
echo "  Installing Psensor                                            "
echo "################################################################"
echo

if ! command -v psensor &>/dev/null; then
    sudo apt install -y \
        lm-sensors \
        psensor

    sudo sensors-detect --auto
fi
