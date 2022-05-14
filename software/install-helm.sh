#!/bin/bash

echo
echo "################################################################"
echo "  Installing helm                                               "
echo "################################################################"
echo

if ! location=$(type -p "helm"); then
  	sudo snap install helm --classic
fi
