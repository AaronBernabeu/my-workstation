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
TGHASH=$(echo -n "/opt/Telegram/Telegram" | md5sum | cut -d' ' -f1)
TGAUTO_DESKTOP="$HOME/.local/share/applications/org.telegram.desktop._${TGHASH}.desktop"

if [ ! -f "$TELEGRAM_ICON" ] || [ ! -f "$TGAUTO_DESKTOP" ]; then
    /opt/Telegram/Telegram &
    TGPID=$!
    for i in $(seq 1 20); do
        [ -f "$TELEGRAM_ICON" ] && [ -f "$TGAUTO_DESKTOP" ] && break
        sleep 1
    done
    kill $TGPID 2>/dev/null || true
fi

mkdir -p ~/.local/share/applications

# Crear org.telegram.desktop.desktop (sin hash) a partir del autogenerado.
# GNOME asocia la ventana de Telegram al desktop entry cuyo nombre coincide con el D-Bus name
# "org.telegram.desktop", por lo que este archivo toma prioridad sobre cualquier otro y evita
# que aparezcan dos iconos en la barra de tareas.
if [ -f "$TGAUTO_DESKTOP" ]; then
    grep -v "^DBusActivatable=" "$TGAUTO_DESKTOP" > ~/.local/share/applications/org.telegram.desktop.desktop
fi

# Ocultar el entry con hash para que no aparezca como segunda app en la búsqueda
if [ -f "$TGAUTO_DESKTOP" ] && ! grep -q "NoDisplay=true" "$TGAUTO_DESKTOP"; then
    sed -i '/^\[Desktop Entry\]/a NoDisplay=true' "$TGAUTO_DESKTOP"
fi

# Eliminar el entry personalizado anterior si existe
rm -f ~/.local/share/applications/telegram-desktop.desktop

update-desktop-database ~/.local/share/applications/ 2>/dev/null || true
