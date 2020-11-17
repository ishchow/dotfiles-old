Personal dotfiles. Assumes openSUSE Tumbleweed installation. Dotfils managed using yadm.

# Install yadm

```
zypper addrepo https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/openSUSE_Tumbleweed/home:TheLocehiliosan:yadm.repo
zypper refresh
zypper install yadm
```

# Clone dotfiles repo

```
yadm clone git@github.com:ishchow/dotfiles.git
```

When prompted to, run the bootstrap script.

# Set yadm class (for alternate files)

```
yadm config local.class Personal # Use Work for work profile
```
