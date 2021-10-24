#!/bin/bash

echo
echo "################################################################"
echo "  Installing Diodon                                             "
echo "################################################################"
echo

if ! location=$(type -p "diodon"); then
    sudo apt install -y diodon
fi
