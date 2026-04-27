#!/bin/bash

echo
echo "################################################################"
echo "  Installing Claude Code                                        "
echo "################################################################"
echo

if ! command -v claude &>/dev/null; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    nvm install --lts
    npm install -g @anthropic-ai/claude-code
fi
