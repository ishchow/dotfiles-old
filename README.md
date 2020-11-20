Personal dotfiles. Assumes openSUSE Tumbleweed installation. Dotfiles managed using [yadm](https://yadm.io/).

# Run bootstrap script

Run with default arguments:

`curl -s https://raw.githubusercontent.com/ishchow/dotfiles/master/.config/yadm/bootstrap | sudo bash -s`

Run with arguments:

`curl -s https://raw.githubusercontent.com/ishchow/dotfiles/master/.config/yadm/bootstrap | sudo bash -s -- -yadm_class Work -gh_key_name personal-t480-hyperv-tw-jeos`

Note: see bootstrap script for all possible arguments.

# Update yadm class (for alternate files)

```
yadm config local.class Personal # Use Work for work profile
```
