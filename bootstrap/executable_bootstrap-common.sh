#/bin/bash

echo "Installing basic patterns..."
sudo zypper in -t pattern base enhanced_base devel_basis
sudo zypper in -y  \
    git \
    nodejs16 \
    npm \
    neovim

echo "Installing bitwarden-cli..."
sudo npm install -g @bitwarden/cli
