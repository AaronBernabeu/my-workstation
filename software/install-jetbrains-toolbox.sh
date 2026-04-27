#!/bin/bash

echo
echo "################################################################"
echo "  Installing JetBrains Toolbox                                  "
echo "################################################################"
echo

if ! test -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox; then
    TOOLBOX_URL=$(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" \
      | grep -Po '"linux":.*?"link":"\K[^"]+')

    TMP_DIR=$(mktemp -d)
    curl -fsSL "$TOOLBOX_URL" -o "$TMP_DIR/jetbrains-toolbox.tar.gz"
    tar -xzf "$TMP_DIR/jetbrains-toolbox.tar.gz" -C "$TMP_DIR"
    "$TMP_DIR"/jetbrains-toolbox-*/jetbrains-toolbox
    rm -rf "$TMP_DIR"
fi
