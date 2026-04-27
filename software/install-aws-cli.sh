#!/bin/bash

echo
echo "################################################################"
echo "  Installing AWS CLI                                            "
echo "################################################################"
echo

if ! command -v aws &>/dev/null; then
    ARCH=$(uname -m)
    TMP_DIR=$(mktemp -d)
    curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${ARCH}.zip" -o "$TMP_DIR/awscliv2.zip"
    unzip "$TMP_DIR/awscliv2.zip" -d "$TMP_DIR"
    sudo "$TMP_DIR/aws/install"
    rm -rf "$TMP_DIR"
fi
