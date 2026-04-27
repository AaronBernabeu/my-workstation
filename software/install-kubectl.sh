#!/bin/bash

echo
echo "################################################################"
echo "  Installing kubectl                                            "
echo "################################################################"
echo

if ! command -v kubectl &>/dev/null; then
    ARCH=$(dpkg --print-architecture)
    KUBECTL_VERSION=$(curl -fsSL https://dl.k8s.io/release/stable.txt)
    curl -fsSL "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl" -o /tmp/kubectl
    sudo install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
    rm /tmp/kubectl
fi
