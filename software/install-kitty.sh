#!/bin/bash

echo
echo "################################################################"
echo "  Installing Kitty terminal                                     "
echo "################################################################"
echo

if [ ! -f ~/.local/kitty.app/bin/kitty ]; then
    curl -fsSL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    mkdir -p ~/.local/bin
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty
    ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/kitten

    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator ~/.local/kitty.app/bin/kitty 50
    sudo update-alternatives --set x-terminal-emulator ~/.local/kitty.app/bin/kitty
fi
