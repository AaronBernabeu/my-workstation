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

# Create .desktop with absolute paths and StartupWMClass so GNOME shows the icon correctly
mkdir -p ~/.local/share/applications
KITTY_BIN="$HOME/.local/kitty.app/bin/kitty"
KITTY_ICON="$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png"
cat > ~/.local/share/applications/kitty.desktop << DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=kitty
GenericName=Terminal emulator
Comment=Fast, feature-rich, GPU based terminal
TryExec=${KITTY_BIN}
StartupNotify=true
StartupWMClass=kitty
Exec=${KITTY_BIN}
Icon=${KITTY_ICON}
Categories=System;TerminalEmulator;
X-TerminalArgExec=--
X-TerminalArgTitle=--title
X-TerminalArgAppId=--class
X-TerminalArgDir=--working-directory
X-TerminalArgHold=--hold
DESKTOP
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications/ 2>/dev/null || true

