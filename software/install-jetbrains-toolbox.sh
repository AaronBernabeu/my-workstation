#!/bin/bash

echo
echo "################################################################"
echo "  Installing JetBrains Toolbox                                  "
echo "################################################################"
echo

if ! test -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo wget https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.20.8337.tar.gz
    sudo tar -xzf jetbrains-toolbox-1.20.8337.tar.gz
    sudo rm jetbrains-toolbox-1.20.8337.tar.gz
    ./jetbrains-toolbox-1.20.8337/jetbrains-toolbox

    cd ${SETUP_DIR}
fi
