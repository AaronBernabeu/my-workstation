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

# Lanzar Telegram brevemente para que genere su icono en ~/.local/share/icons/
TELEGRAM_ICON="$HOME/.local/share/icons/hicolor/256x256/apps/org.telegram.desktop.png"
if [ ! -f "$TELEGRAM_ICON" ]; then
    /opt/Telegram/Telegram &
    TGPID=$!
    for i in $(seq 1 20); do
        [ -f "$TELEGRAM_ICON" ] && break
        sleep 1
    done
    kill $TGPID 2>/dev/null || true
fi

mkdir -p ~/.local/share/applications
cat > ~/.local/share/applications/telegram-desktop.desktop <<EOF
[Desktop Entry]
Name=Telegram Desktop
Comment=Official desktop app for the Telegram messaging service
Exec=/opt/Telegram/Telegram -- %u
Icon=$TELEGRAM_ICON
Terminal=false
Type=Application
Categories=Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
StartupWMClass=TelegramDesktop
EOF

update-desktop-database ~/.local/share/applications/ 2>/dev/null || true
