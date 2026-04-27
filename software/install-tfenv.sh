#!/bin/bash

echo
echo "################################################################"
echo "  Installing tfenv (Terraform version manager)                  "
echo "################################################################"
echo

if [ ! -d ~/.tfenv ]; then
    git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
    sudo ln -sf ~/.tfenv/bin/* /usr/local/bin
fi
