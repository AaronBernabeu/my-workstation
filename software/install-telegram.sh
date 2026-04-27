#!/bin/bash

echo
echo "################################################################"
echo "  Installing Telegram                                           "
echo "################################################################"
echo

if ! command -v telegram-desktop &>/dev/null; then
    curl -fsSL "https://telegram.org/dl/desktop/linux" -o /tmp/telegram.tar.xz
    sudo tar -xf /tmp/telegram.tar.xz -C /opt
    sudo ln -sf /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
    rm /tmp/telegram.tar.xz
fi
