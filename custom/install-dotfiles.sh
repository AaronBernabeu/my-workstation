#!/bin/bash

echo
echo "################################################################"
echo "  Installing my dotfiles                                        "
echo "################################################################"
echo

SETUP_DIR="$(pwd)"
if ! test -d ~/.dotfiles; then
  git clone https://github.com/AaronBernabeu/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
else
  cd ~/.dotfiles
  git pull
fi

sh ./install
cd ${SETUP_DIR}
