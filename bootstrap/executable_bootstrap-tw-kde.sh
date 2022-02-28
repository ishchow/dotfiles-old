source ~\bootstrap\bootstrap-common.sh

echo "Installing packages..."
sudo zypper in -y \
    flatpak \
    discover \
    discover-backend-flatpak \
    kdeconnect-kde \
    yakuake \
    kate \
    ark \
    opi \
    neovim \
    touchegg \
    libvulkan_intel \
    libvulkan_intel-32bit

echo "Starting systmed services..."
sudo systemctl enable --now touchegg.service

echo "Setting up flathub repo..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing flatpak apps..."
flatpak install -y \
    com.bitwarden.desktop \
    com.calibre_ebook.calibre \
    com.discordapp.Discord \
    com.getmailspring.Mailspring \
    com.github.Eloston.UngoogledChromium \
    com.github.tchx84.Flatseal \
    com.github.wwmm.easyeffects \
    com.sindresorhus.Caprine \
    com.spotify.Client  \
    com.valvesoftware.Steam \
    org.freedesktop.Platform.VulkanLayer.MangoHud \
    com.visualstudio.code \
    io.neovim.nvim \
    md.obsidian.Obsidian \
    org.gimp.GIMP \
    org.kde.gwenview \
    org.kde.kcalc \
    org.kde.okular \
    org.libreoffice.LibreOffice \
    org.mozilla.firefox \
    org.qbittorrent.qBittorrent \
    org.videolan.VLC

flatpak override --user --env=MANGOHUD=1 com.valvesoftware.Steam
flatpak override --user --env=GDK_SCALE=2 com.valvesoftware.Steam
sudo flatpak update

echo "Installing konsave..."
sudo python3 -m pip install konsave

STR=$(konsave -l)
if [[ "$STR" == *"No profile found"* ]]; then
    echo "Restoring plasma settings..."
    konsave -i default.knsv
    konsave -a default
fi
