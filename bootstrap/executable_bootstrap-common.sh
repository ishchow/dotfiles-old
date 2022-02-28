#/bin/bash

echo "Installing basic developer tools..."
sudo zypper in -y  \
    git \
    nodejs16 \
    npm \

echo "Installing bitwarden-cli"
sudo npm install -g @bitwarden/cli

echo "Setting up firewall rules..."
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
