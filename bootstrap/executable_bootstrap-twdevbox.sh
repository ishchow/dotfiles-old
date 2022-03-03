#!/bin/bash
source ./bootstrap.sh || source ./executable_bootstrap.sh

if ! command -v code &> /dev/null; then
    sudo zypper ar -p 105 https://packages.microsoft.com/yumrepos/vscode vscode
    sudo zypper ref
fi

if ! $(zypper lr | grep "vscode" &> /dev/null); then
    sudo zypper ar -p 105 "https://packages.microsoft.com/yumrepos/vscode vscode"
fi

sudo zypper ref
sudo zypper in -y \
	code
