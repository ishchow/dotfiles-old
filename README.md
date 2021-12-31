Personal dotfiles for Windows and Linux. Dotfiles managed using [chezmoi](https://www.chezmoi.io/).

# Setup dependencies

## Windows

Open Powershell as admin:

Set execution policy to bypass so we can run bw cli. I generally find the defaults to be annoying anyways:

`Set-ExecutionPolicy -ExecutionPolicy Bypass`

Install chocolatey:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Install chezmoi and nodejs (needed for bw cli):

`choco install -y chezmoi nodejs`

Install bw cli:

`npm install -g @bitwarden/cli`

## Linux (OpenSUSE Tumbleweed)

[Install chezmoi](https://www.chezmoi.io/docs/install/)

```
sudo zypper in -y npm yarn
sudo npm install -g @bitwarden/cli
```

# Init dotfiles
chezmoi init --apply ishchow


# Initialize dotfiles

`chezmoi init --apply ishchow`

# Bootstrap new system
## Linux (OpenSUSE Tumbleweed)

Enter bootstrap directory:

`cd ~/bootstrap`

Run with default arguments:

`./bootstrap`

## Windows

Open Powershell as admin.

Enter bootstrap directory:

`cd ~\bootstrap`

Run bootstrap script:

`.\bootstrap.ps1`
