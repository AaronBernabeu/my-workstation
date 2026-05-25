#!/bin/bash

echo
echo "################################################################"
echo "  Installing JetBrains Toolbox                                  "
echo "################################################################"
echo

TOOLBOX_BIN="$HOME/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox"

if ! test -f "$TOOLBOX_BIN"; then
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

    EXTRACTED_BIN=$(find "$TMP_DIR" -name "jetbrains-toolbox" -type f | head -1)
    if [ -z "$EXTRACTED_BIN" ]; then
        echo "ERROR: No se encontró el binario tras extraer el tar.gz"
        rm -rf "$TMP_DIR"
        exit 1
    fi

    # Instalar libfuse2 (nombre del paquete varía por versión de Ubuntu)
    FUSE_PKG=$(apt-cache search --names-only '^libfuse2' | awk '{print $1}' | head -1)
    if [ -n "$FUSE_PKG" ]; then
        sudo apt-get install -y "$FUSE_PKG"
    fi

    # Copiar el binario a su ubicación definitiva
    mkdir -p "$(dirname "$TOOLBOX_BIN")"
    cp "$EXTRACTED_BIN" "$TOOLBOX_BIN"
    chmod +x "$TOOLBOX_BIN"
    rm -rf "$TMP_DIR"

    # Crear entrada en el menú de aplicaciones
    mkdir -p ~/.local/share/applications
    cat > ~/.local/share/applications/jetbrains-toolbox.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=JetBrains Toolbox
Comment=Manage your JetBrains tools
Exec=$TOOLBOX_BIN
Icon=jetbrains-toolbox
Terminal=false
Categories=Development;IDE;
StartupWMClass=jetbrains-toolbox
EOF

    echo "JetBrains Toolbox instalado. Lanzando en background..."
    nohup "$TOOLBOX_BIN" > /tmp/jetbrains-toolbox.log 2>&1 &

    echo "JetBrains Toolbox instalado correctamente. Busca el icono en la bandeja del sistema."
fi
