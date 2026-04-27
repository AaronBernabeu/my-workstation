#!/bin/bash

echo
echo "################################################################"
echo "  Installing helm                                               "
echo "################################################################"
echo

if ! command -v helm &>/dev/null; then
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4 | bash
fi

if ! helm plugin list | grep -q "secrets"; then
  helm plugin install https://github.com/jkroepke/helm-secrets/releases/download/v4.7.6/secrets-4.7.6.tgz --verify=false
fi
