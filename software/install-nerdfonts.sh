#!/bin/bash

echo
echo "################################################################"
echo "  Installing Nerd Fonts (JetBrainsMono)                        "
echo "################################################################"
echo

if [ ! -d ~/.local/share/fonts/JetBrainsMonoNFM ]; then
    TMP_DIR=$(mktemp -d)
    curl -fsSL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" \
      -o "$TMP_DIR/JetBrainsMono.zip"
    mkdir -p ~/.local/share/fonts/JetBrainsMonoNFM
    unzip "$TMP_DIR/JetBrainsMono.zip" -d ~/.local/share/fonts/JetBrainsMonoNFM
    fc-cache -f
    rm -rf "$TMP_DIR"
fi
