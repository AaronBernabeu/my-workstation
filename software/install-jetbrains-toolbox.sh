#!/bin/bash

echo
echo "################################################################"
echo "  Installing JetBrains Toolbox                                  "
echo "################################################################"
echo

TOOLBOX_BIN="$HOME/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox"

TOOLBOX_JRE="$(dirname "$TOOLBOX_BIN")/jre"

if ! test -f "$TOOLBOX_BIN" || ! test -d "$TOOLBOX_JRE"; then
    TOOLBOX_URL=$(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" \
      | python3 -c "import sys,json; data=json.load(sys.stdin); print(data['TBA'][0]['downloads']['linux']['link'])")

    if [ -z "$TOOLBOX_URL" ]; then
        echo "ERROR: No se pudo obtener la URL de JetBrains Toolbox"
        exit 1
    fi

    echo "Descargando desde: $TOOLBOX_URL"

    TMP_DIR=$(mktemp -d)
    curl -fL --progress-bar --max-time 300 "$TOOLBOX_URL" -o "$TMP_DIR/jetbrains-toolbox.tar.gz"

    if [ $? -ne 0 ] || [ ! -s "$TMP_DIR/jetbrains-toolbox.tar.gz" ]; then
        echo "ERROR: Fallo la descarga de JetBrains Toolbox"
        rm -rf "$TMP_DIR"
        exit 1
    fi

    tar -xzf "$TMP_DIR/jetbrains-toolbox.tar.gz" -C "$TMP_DIR"

    # Encontrar el directorio extraído (jetbrains-toolbox-X.Y.Z/)
    EXTRACTED_DIR=$(ls -d "$TMP_DIR"/jetbrains-toolbox-*/ 2>/dev/null | head -1)
    if [ -z "$EXTRACTED_DIR" ] || [ ! -f "$EXTRACTED_DIR/bin/jetbrains-toolbox" ]; then
        echo "ERROR: No se encontró el directorio extraído con el binario"
        rm -rf "$TMP_DIR"
        exit 1
    fi

    # Copiar el directorio bin completo (incluye JRE, libs, etc.)
    mkdir -p "$(dirname "$TOOLBOX_BIN")"
    cp -r "$EXTRACTED_DIR/bin/." "$(dirname "$TOOLBOX_BIN")/"
    chmod +x "$TOOLBOX_BIN"
    rm -rf "$TMP_DIR"

    echo "JetBrains Toolbox instalado. Lanzando en background para que genere sus iconos..."
    nohup "$TOOLBOX_BIN" > /tmp/jetbrains-toolbox.log 2>&1 &

    # Esperar a que Toolbox genere el icono en su primer arranque
    ICON_PATH="$HOME/.local/share/icons/hicolor/scalable/apps/toolbox.svg"
    for i in $(seq 1 20); do
        [ -f "$ICON_PATH" ] && break
        sleep 1
    done

    # Crear entrada en el menú de aplicaciones con rutas absolutas y StartupWMClass
    mkdir -p ~/.local/share/applications
    cat > ~/.local/share/applications/jetbrains-toolbox.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=JetBrains Toolbox
Comment=Manage your JetBrains tools
Exec=$TOOLBOX_BIN
Icon=$ICON_PATH
Terminal=false
Categories=Development;IDE;
StartupWMClass=jetbrains-toolbox
StartupNotify=true
EOF

    update-desktop-database ~/.local/share/applications/ 2>/dev/null || true
    gtk-update-icon-cache -f -t ~/.local/share/icons/hicolor/ 2>/dev/null || true

    echo "JetBrains Toolbox instalado correctamente. Busca el icono en la bandeja del sistema."
fi
