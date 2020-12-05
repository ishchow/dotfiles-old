" Auto-install packer
if empty(glob('~/.local/share/nvim/site/pack/packer/opt/packer.nvim'))
    silent !git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
	packadd packer.nvim
    autocmd VimEnter * PackerInstall
else
    packadd packer.nvim
    autocmd BufWritePost plugins.lua PackerCompile
endif

if has('nvim-0.5')
    lua require('plugins')
endif
