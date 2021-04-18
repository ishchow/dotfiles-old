let s:is_packer_not_installed = empty(glob('~/.local/share/nvim/site/pack/packer/opt/packer.nvim'))

" Auto-install packer
if s:is_packer_not_installed 
    silent !git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
endif

packadd packer.nvim
luafile ~/.config/nvim/lua/plugins.lua
autocmd BufWritePost plugins.lua PackerCompile

" Auto-install plugins
if s:is_packer_not_installed 
    autocmd VimEnter * PackerInstall
endif
