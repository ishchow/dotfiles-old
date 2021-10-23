#/bin/bash

# parse args
# taken from: https://brianchildress.co/named-parameters-in-bash/
while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
        # echo $1 $2 // Optional to see the parameter:value result
    fi
    shift
done

echo "Updating system..."
sudo zypper ref && sudo zypper dup -y

echo "Installing core packages..."
sudo zypper in -y -t pattern devel_basis
sudo zypper in -y \
    wget \
    tree \
    curl \
    jq \
    fuse \
    ripgrep \
    ripgrep-bash-completion \
    bat \
    nodejs-default \
    npm \
    yarn \
    exa \
    ruby \
    python \
    python2-pip \
    python3 \
    python3-pip \
    python3-virtualenvwrapper \
    git \
    gpg2 \
    hub \
    tig \
    tmux \
    fzf \
    fzf-bash-completion \
    fzf-tmux \
    clang \
    lldb

echo "Installing global node packages"
sudo npm install -g \
    @bitwarden/cli \

echo "Installing global python packages"
sudo pip3 install \
    pynvim \
    neovim-remote

if ! command -v nvim &> /dev/null; then
    echo "Installing neovim from source..."
    sudo zypper in -y ninja libtool autoconf automake cmake gcc-c++ gettext-tools
    git clone https://github.com/neovim/neovim.git ~/.nvim
    make CMAKE_BUILD_TYPE=RelWithDebInfo -C ~/.nvim
    sudo make -C ~/.nvim install
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Installing tmux plugin manager (tpm)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if ! command -v fff &> /dev/null; then
    echo "Installing fast file finder (fff)..."
    git clone https://github.com/dylanaraps/fff ~/.fff
    sudo make -C ~/.fff install
fi

if ! command -v lazygit &> /dev/null; then
    echo "Installing lazygit..."
    sudo zypper ar https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Tumbleweed/home:Dead_Mozay.repo
    sudo zypper --gpg-auto-import-keys ref
    sudo zypper in -y lazygit
fi

if ! command -v rustup &> /dev/null; then
    echo "Installing rustup..."
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
fi

if ! command -v rust-analuzer %> /dev/null; then
    echo "Installing rust-analyzer..."
    mkdir -p ~/.local/bin
    curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
    chmod +x ~/.local/bin/rust-analyzer
fi

if [ ! -d ~/projects ]; then
    echo "Creating projects folder..."
    mkdir -p ~/projects
fi

if [ ! -d ~/projects/personal-site ]; then
    echo "Cloning personal webiste..."
    git clone git@github.com:ishchow/personal-site.git ~/projects/personal-site
    if [ ! $? -eq 0 ]; then
        git clone https://github.com/ishchow/personal-site.git ~/projects/personal-site
    fi
    sudo firewall-cmd --permanent --zone=public --add-service=http
    sudo firewall-cmd --permanent --zone=public --add-service=https
    sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
    sudo firewall-cmd --reload
fi

if ! command -v todo.sh &> /dev/null; then
    echo "Installing todo.sh..."
    git clone https://github.com/todotxt/todo.txt-cli ~/.todotxtcli
    sudo make -C ~/.todotxtcli install
fi

if command -v systemctl &> /dev/null; then
    if [ ! -d ~/.git-sync ]; then
        echo "Downloading git-sync..."
        git clone https://github.com/simonthum/git-sync.git ~/.git-sync
    fi
fi
