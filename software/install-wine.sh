#!/bin/bash

echo
echo "################################################################"
echo "  Installing Wine                                               "
echo "################################################################"
echo

if ! location=$(type -p "wine"); then
  	sudo apt install -y wine
fi
