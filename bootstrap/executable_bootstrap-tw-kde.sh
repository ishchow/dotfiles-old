add_home_repo () {
    if ! $(zypper lr | grep "$1" &> /dev/null); then
        sudo zypper ar -p 105 "https://download.opensuse.org/repositories/$1/openSUSE_Tumbleweed/$1.repo"
    fi
}

echo "Adding home repositories..."
add_home_repo "home:rxmd"
add_home_repo "home:Dead_Mozay"

echo "Adding packman essentials repository..."
sudo zypper ar -cfp 105 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials packamn-essentials

echo "Installing packages..."
sudo zypper ref
sudo zypper in -y \
    flatpak \
    discover \
    discover-backend-flatpak \
    kdeconnect-kde \
    yakuake \
    kate \
    ark \
    opi \
    touchegg \
    kwin-script-tiling-bismuth \
    catatonit \
    containerd \
    criu \
    docker \
    docker-bash-completion \
    libnet9 \
    python38-protobuf \
    runc \
    gnome-keyring \
    virtual-desktop-bar \
    onedrive \
    onedrive-bash-completion \
    pipewire-alsa \
    pipewire-pulseaudio \
    wireplumber \
    pipewire-aptx

if ! command -v distrobox &> /dev/null; then
    echo "Installing distrobox..."
    curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
fi

echo "Starting services..."
sudo systemctl enable --now touchegg.service
sudo systemctl enable --now docker.service
systemctl --user enable --now pipewire.service
systemctl --user enable --now wireplumber.service
systemctl --user enable --now pipewire-pulse.{service,socket}
systemctl --user enable --now onedrive

if [ ! getent group docker &> /dev/null ]; then
    echo "Setting up docker group..."
    getent group docker || sudo groupadd docker 
    sudo usermod -aG docker $USER 
    newgrp docker
fi

echo "Setting up firewall rules..."
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect-kde
sudo firewall-cmd --reload

echo "Setting up flathub repo..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing flatpaks..."
sudo flatpak install -y \
    com.bitwarden.desktop \
    com.calibre_ebook.calibre \
    com.discordapp.Discord \
    com.getmailspring.Mailspring \
    com.github.Eloston.UngoogledChromium \
    com.github.tchx84.Flatseal \
    com.github.wwmm.easyeffects \
    com.sindresorhus.Caprine \
    com.spotify.Client  \
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
    org.videolan.VLC \
    com.valvesoftware.Steam \
    org.gtk.Gtk3theme.Breeze \
    org.freedesktop.Platform.GStreamer.gstreamer-vaapi \
    org.freedesktop.Platform.ffmpeg-full

flatpak override --user --filesystem=xdg-config/gtk-3.0:ro
flatpak override --user --env=MANGOHUD=1 com.valvesoftware.Steam
flatpak override --user --env=GDK_SCALE=2 com.valvesoftware.Steam
flatpak override --user --filesystem=xdg-config/MangoHud:ro com.valvesoftware.Steam
flatpak override --user --filesystem=xdg-data/icons com.valvesoftware.Steam
flatpak override --user --filesystem=xdg-data/applications com.valvesoftware.Steam
flatpak override --user --filesystem=xdg-desktop com.valvesoftware.Steam

# workaround for missing libs after steam installation
sudo flatpak update

echo "Updating xgg settings..."
xdg-settings set default-web-browser org.mozilla.firefox.desktop

echo "Updating xdg user dirs..."
if test ~/OneDrive/; then
    if ! ls -l ~/Music; then
        rmdir ~/Music/
        ln -s ~/OneDrive/Music/ ~/Music
        xdg-user-dirs-update --set MUSIC ~/OneDrive/Music/
    fi

    if ! ls -l ~/Pictures; then
        rmdir ~/Pictures
        ln -s ~/OneDrive/Pictures/ ~/Pictures
        xdg-user-dirs-update --set PICTURES ~/OneDrive/Pictures/
    fi

    if ! ls -l ~/Videos; then
        rmdir ~/Videos
        ln -s ~/OneDrive/Videos/ ~/Videos
        xdg-user-dirs-update --set VIDEOS ~/OneDrive/Videos/
    fi
fi

if flatpak list --app | grep "Firefox" &> /dev/null && ! zypper se -i firefox &> /dev/null; then
    echo "Removing native firefox..."
    sudo zypper rm --clean-deps firefox
fi

if [ ! getent group docker &> /dev/null ]; then
    echo "Setting up docker group..."
    getent group docker || sudo groupadd docker 
    sudo usermod -aG docker $USER 
    newgrp docker
fi

echo "Installing konsave..."
sudo python3 -m pip install konsave

STR=$(konsave -l)
if [[ "$STR" == *"No profile found"* ]]; then
    echo "Restoring plasma settings..."
    konsave -i ~/default.knsv
    konsave -a default
fi

kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,ExposeAll"
