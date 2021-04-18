Personal dotfiles for Windows and Linux. Dotfiles managed using [chezmoi](https://www.chezmoi.io/).

# Install chezmoi

[Install chezmoi](https://www.chezmoi.io/docs/install/)

# Initialize dotfiles

`chezmoi init --apply username`

# Bootstrap new system
## Linux (OpenSUSE Tumbleweed)

Enter bootstrap directory:

`cd ~/.config/bootstrap`

Run with default arguments:

`./bootstrap`

Run with arguments:

`./bootstrap --yadm_class Personal --gh_key_name personal-t480-hyperv-tw-jeos`

## Windows

Open powershell as admin.

Enter bootstrap directory:

`cd ~/.config/bootstrap`

Run bootstrap script:

`./bootstrap.ps1`
