#!/bin/bash

echo
echo "################################################################"
echo "  Installing Docker                                             "
echo "################################################################"
echo

if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com | sh
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
    sudo usermod -aG docker "$USER"
fi

sudo tee /etc/docker/daemon.json << EOF
{
  "default-address-pools": [
    {
      "base": "10.10.0.0/16",
      "size": 24
    }
  ]
}
EOF
