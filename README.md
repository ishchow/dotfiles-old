Personal dotfiles. Assumes openSUSE Tumbleweed installation. Dotfils managed using [yadm](https://yadm.io/).

# Run bootstrap script

Run with default arguments:

`curl https://raw.githubusercontent.com/ishchow/dotfiles/master/.config/yadm/bootstrap | sudo bash -s`

Run with arguments:

`curl https://raw.githubusercontent.com/ishchow/dotfiles/master/.config/yadm/bootstrap | sudo bash -s -- -yadm_class Work`

Note: see bootstrap script for all possible arguments.

# Update yadm class (for alternate files)

```
yadm config local.class Personal # Use Work for work profile
```
