#!/bin/bash

echo
echo "################################################################"
echo "  Installing JetBrains Toolbox                                  "
echo "################################################################"
echo

if ! test -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo wget https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-1.24.11947.tar.gz
    sudo tar -xzf jetbrains-toolbox-1.24.11947.tar.gz
    sudo rm jetbrains-toolbox-1.24.11947.tar.gz
    ./jetbrains-toolbox-1.24.11947/jetbrains-toolbox

    cd ${SETUP_DIR}
fi
