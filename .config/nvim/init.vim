" Load plugins
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim

if has('nvim-0.5')
    lua require("lsp")
    lua require("treesitter")
    lua require("nvim_dap")
endif
