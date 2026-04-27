#!/bin/bash

echo
echo "################################################################"
echo "  Installing k9s                                              "
echo "################################################################"
echo

if ! command -v k9s &>/dev/null; then
    ARCH=$(dpkg --print-architecture)
    K9S_URL=$(curl -s https://api.github.com/repos/derailed/k9s/releases/latest \
      | grep -Po '"browser_download_url": *"\K[^"]*Linux_'"$ARCH"'\.tar\.gz')

    TMP_DIR=$(mktemp -d)
    curl -fsSL "$K9S_URL" -o "$TMP_DIR/k9s.tar.gz"
    tar -xzf "$TMP_DIR/k9s.tar.gz" -C "$TMP_DIR"
    sudo mv "$TMP_DIR/k9s" /usr/local/bin/k9s
    rm -rf "$TMP_DIR"
fi
