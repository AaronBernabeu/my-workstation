#!/bin/bash

echo
echo "################################################################"
echo "  Installing gTile GNOME Shell Extension                        "
echo "################################################################"
echo

GTILE_UUID="gTile@vibou"
GTILE_WEB_ID="28"

if ! [ -a "~/.local/share/gnome-shell/extensions/$GTILE_UUID" ]; then
    gnome-shell-extension-installer $GTILE_WEB_ID --yes
fi

gnome-extensions enable $GTILE_UUID
