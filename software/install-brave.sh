#!/bin/bash

echo
echo "################################################################"
echo "  Installing Brave                                              "
echo "################################################################"
echo

if ! command -v brave-browser &> /dev/null; then
    curl -fsSL https://dl.brave.com/install.sh | sh
fi
