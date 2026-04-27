#!/bin/bash

echo
echo "################################################################"
echo "  Installing Google Chrome                                      "
echo "################################################################"
echo

if ! command -v google-chrome-stable &> /dev/null; then
    curl -fsSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/chrome.deb
    sudo apt install -y /tmp/chrome.deb
    rm /tmp/chrome.deb
fi
