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

if [ ! -f /usr/share/applications/telegram-desktop.desktop ]; then
    sudo tee /usr/share/applications/telegram-desktop.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Telegram Desktop
Comment=Official desktop app for the Telegram messaging service
Exec=/opt/Telegram/Telegram -- %u
Icon=/opt/Telegram/telegram.png
Terminal=false
Type=Application
Categories=Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
StartupWMClass=TelegramDesktop
EOF
fi
