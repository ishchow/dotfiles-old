" Auto-install packer
if empty(glob('~/.local/share/nvim/site/pack/packer/opt/packer.nvim'))
    silent !git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
    autocmd VimEnter * PackerInstall
endif

packadd packer.nvim
luafile ~/.config/nvim/lua/plugins.lua
autocmd BufWritePost plugins.lua PackerCompile
