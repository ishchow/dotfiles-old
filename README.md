Personal dotfiles. Assumes openSUSE Tumbleweed installation. Dotfiles managed using [yadm](https://yadm.io/).

# Run bootstrap script

Download bootstrap script:

```
curl -s https://raw.githubusercontent.com/ishchow/dotfiles/master/.config/yadm/bootstrap > bootstrap
chmod a+x bootstrap
```


Run with default arguments:

`./bootstrap`

Run with arguments:

`./bootstrap -yadm_class Personal -gh_key_name personal-t480-hyperv-tw-jeos`

Delete downloaded setup script:

`rm bootstrap`

# Update yadm class (for alternate files)

```
yadm config local.class Personal # Use Work for work profile
```
