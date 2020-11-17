" Load plugins
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim

if has('nvim-0.5')
    " Load LSP
    lua require("lsp")
endif
