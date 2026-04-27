#!/bin/bash

echo
echo "################################################################"
echo "  Installing Starship prompt                                    "
echo "################################################################"
echo

if ! command -v starship &>/dev/null; then
    curl -fsSL https://starship.rs/install.sh | sh -s -- --yes
fi
