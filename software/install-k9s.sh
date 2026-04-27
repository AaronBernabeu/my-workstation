#!/bin/bash

echo
echo "################################################################"
echo "  Installing k9s                                              "
echo "################################################################"
echo

if ! command -v k9s &>/dev/null; then
    ARCH=$(dpkg --print-architecture)
    K9S_URL=$(curl -s https://api.github.com/repos/derailed/k9s/releases/latest \
      | grep -Po '"browser_download_url": *"\K[^"]*linux_'"$ARCH"'\.deb')

    TMP_DIR=$(mktemp -d)
    curl -fsSL "$K9S_URL" -o "$TMP_DIR/k9s.deb"
    sudo apt install -y "$TMP_DIR/k9s.deb"
    rm -rf "$TMP_DIR"
fi
