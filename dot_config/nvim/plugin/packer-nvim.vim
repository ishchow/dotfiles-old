let packer_opt_path = stdpath('data') . '/site/pack/packer/opt/packer.nvim'
let s:is_packer_not_installed = !filereadable(packer_opt_path)

" Auto-install packer
if s:is_packer_not_installed
    silent execute 'git clone https://github.com/wbthomason/packer.nvim ' . packer_opt_path
endif

packadd packer.nvim
luafile ~/.config/nvim/lua/plugins.lua
autocmd BufWritePost plugins.lua PackerCompile

" Auto-install plugins
if s:is_packer_not_installed
    autocmd VimEnter * PackerInstall
endif
