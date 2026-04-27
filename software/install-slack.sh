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
