#!/bin/bash

echo
echo "################################################################"
echo "  Installing kubectl                                            "
echo "################################################################"
echo

if ! location=$(type -p "kubectl"); then
  	sudo snap install kubectl --classic
fi
