#!/bin/bash

echo
echo "################################################################"
echo "  Installing Slack                                              "
echo "################################################################"
echo

if ! command -v slack &>/dev/null; then
    curl -fsSL "https://downloads.slack-edge.com/desktop-releases/linux/x64/4.47.69/slack-desktop-4.47.69-amd64.deb" -o /tmp/slack.deb
    sudo apt install -y /tmp/slack.deb
    rm /tmp/slack.deb
fi

# Disable GPU acceleration to prevent Electron's GPU subprocess from crashing on some drivers
SLACK_DESKTOP="$HOME/.local/share/applications/slack.desktop"
if [ ! -f "$SLACK_DESKTOP" ] || ! grep -q "\-\-disable-gpu" "$SLACK_DESKTOP"; then
    mkdir -p "$HOME/.local/share/applications"
    cp /usr/share/applications/slack.desktop "$SLACK_DESKTOP"
    sed -i 's|Exec=/usr/bin/slack %U|Exec=/usr/bin/slack --disable-gpu %U|g' "$SLACK_DESKTOP"
fi
