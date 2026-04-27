#!/bin/bash

echo
echo "################################################################"
echo "  Installing NVM (Node Version Manager)                        "
echo "################################################################"
echo

if [ ! -f ~/.nvm/nvm.sh ]; then
    NVM_VERSION=$(curl -fsSL https://api.github.com/repos/nvm-sh/nvm/releases/latest \
      | grep -Po '"tag_name": "\K[^"]+')
    curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash
fi
