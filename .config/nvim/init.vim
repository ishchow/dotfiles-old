" Load plugins
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim

let s:nvim_version = api_info().version
if s:nvim_version.minor == 5
    " Load LSP
    lua require("lsp")
endif
