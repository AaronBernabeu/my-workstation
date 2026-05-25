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

# Copy .desktop files so GNOME/XDG can find kitty
mkdir -p ~/.local/share/applications
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Fix the icon path inside the .desktop file
sed -i "s|Icon=kitty|Icon=$(readlink -f ~/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png)|g" ~/.local/share/applications/kitty.desktop
update-desktop-database ~/.local/share/applications/ 2>/dev/null || true

