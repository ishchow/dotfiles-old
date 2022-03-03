#!/bin/bash
source ./bootstrap.sh || source ./executable_bootstrap.sh

echo "Adding repositories..."
if ! $(zypper lr | grep "vscode" &> /dev/null); then
    sudo zypper ar -p 105 "https://packages.microsoft.com/yumrepos/vscode vscode"
fi

echo "Installing packages..."
sudo zypper ref
sudo zypper in -y \
	code \
    libfuse2 \
    libfuse2-32bit \
    firefox

echo "Exporting binaries, apps, and services to host system..."
distrobox-export --app code --extra-flags "--foreground"
distrobox-export --bin $(which nvim) --export-path ~/.local/bin
distrobox-export --bin $(which git) --export-path ~/.local/bin

if test ~/.local/share/JetBrains/Toolbox/scripts/idea; then
    distrobox-export \
        --bin ~/.local/share/JetBrains/Toolbox/scripts \
        --export-path ~/.local/bin
fi
