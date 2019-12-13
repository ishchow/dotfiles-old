" Load plugins
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc-nvim.vim
source ~/.config/nvim/settings.vim

set background=dark
syntax on
colorscheme onedark

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
