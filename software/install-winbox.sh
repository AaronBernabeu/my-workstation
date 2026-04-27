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
    sudo install -o root -g root -m 0755 "$TMP_DIR/WinBox_Linux" /usr/local/bin/winbox
    rm -rf "$TMP_DIR"
fi