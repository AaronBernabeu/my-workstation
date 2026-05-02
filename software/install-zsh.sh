#!/bin/bash

echo
echo "################################################################"
echo "  Installing Z Shell + Oh My Zsh                                "
echo "################################################################"
echo

if ! dpkg -l fonts-powerline &>/dev/null; then
    sudo apt install -y fonts-powerline
fi

if ! command -v zsh &>/dev/null; then
    sudo apt install -y zsh
fi

if ! command -v toilet &>/dev/null; then
    sudo apt install -y toilet
fi

if [ ! -f ~/.zshrc ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ~/.oh-my-zsh/custom/plugins/autoupdate

    sudo chsh -s "$(which zsh)" "$USER"
fi
