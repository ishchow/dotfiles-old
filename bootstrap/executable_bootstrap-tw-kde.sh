if ! command -v opi &> /dev/null; then
    echo "Installing opi..."
    sudo zypper in -y opi
    echo "Installing codecs..."
    opi codecs
fi

if ! command -v flatpak &> /dev/null; then
    echo "Installin flatpak..."
    sudo zypper install -y flatpak

    echo "Setting up flathub repo"
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    echo "Installing flatpak apps..."
    flatpak install -y \
        com.bitwarden.desktop \
        com.discordapp.Discord \
        com.obsproject.Studio \
        com.sindresorhus.Caprine \
        com.sindresorhus.Caprine \
fi

if ! commmand -v qdbus &> /dev/null; then
    echo "SInstalling libqt4 for qdbus command..."
    sudo zypper in -y libqt4
fi

if ! command -v code &> /dev/null; then
    echo "Instlaling vscode..."
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
    sudo zypper ref -f
    sudo zypper install -y code
fi

if ! zypper se -i applet-window-title &> /dev/null; then
    echo "Installing applet-window-title..."
    opi applet-window-title
fi

if ! command -v google-chrome &> /dev/null; then
    echo "Instlaling Google Chrome..."
    sudo zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 google-chrome
    wget https://dl.google.com/linux/linux_signing_key.pub
    sudo rpm --import linux_signing_key.pub
    rm linux_signing_key.pub
    sudo zypper ref -f
    sudo zypper in -y google-chrome-stable
fi

# Install edge
if ! command -v microsoft-edge &> /dev/null; then
    echo "Installing microsoft-edge..."
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo zypper ar https://packages.microsoft.com/yumrepos/edge microsoft-edge-beta
    sudo zypper ref -f
    sudo zypper in -y microsoft-edge-stable
fi

# Nuke packagekit
sudo systemctl disable --now packagekit
sudo zypper rm --clean-deps PackageKit*
sudo zypper addlock PackageKit* plasma5-pk-updates* discover-backend-packagekit

# Touchpad gestures
if ! command -v touchegg &> /dev/null; then
    echo "Installing touchegg..."
    sudo zypper in -y touchegg
    sudo systemctl enable --now touchegg.service
fi

if ! command -v konsave &> /dev/null; then
    echo "Installing konsave..."
    python3 -m pip install konsave
fi

