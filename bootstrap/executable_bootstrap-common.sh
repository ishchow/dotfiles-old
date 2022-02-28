#/bin/bash

echo "Installing basic developer tools..."
sudo zypper in -y -t pattern devel_basis
sudo zypper in -y  \
    git \ 
    nodejs16 \
    npm \

echo "Installing bitwarden-cli"
sudo npm install -g @bitwarden/cli
