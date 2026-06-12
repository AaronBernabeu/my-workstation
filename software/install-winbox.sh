#!/bin/bash

echo
echo "################################################################"
echo "  Installing WinBox                                             "
echo "################################################################"
echo

if ! command -v winbox &>/dev/null; then
    TMP_DIR=$(mktemp -d)
    curl -fsSL "https://download.mikrotik.com/routeros/winbox/4.1/WinBox_Linux.zip" -o "$TMP_DIR/winbox.zip"
    unzip "$TMP_DIR/winbox.zip" -d "$TMP_DIR"
    sudo install -o root -g root -m 0755 "$TMP_DIR/WinBox" /usr/local/bin/winbox
    sudo mkdir -p /usr/local/share/icons
    sudo install -o root -g root -m 0644 "$TMP_DIR/assets/img/winbox.png" /usr/local/share/icons/winbox.png
    sudo tee /usr/share/applications/winbox.desktop > /dev/null <<EOF
[Desktop Entry]
Type=Application
Name=WinBox
Exec=winbox
Icon=/usr/local/share/icons/winbox.png
Categories=Network;
EOF
    rm -rf "$TMP_DIR"
fi