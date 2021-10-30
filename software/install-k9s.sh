#!/bin/bash

echo
echo "################################################################"
echo "  Installing k9s                                              "
echo "################################################################"
echo

if ! location=$(type -p "k9s"); then
  	curl -sS https://webinstall.dev/k9s | bash
  	sudo mv ~/.local/bin/k9s /usr/local/bin
fi
