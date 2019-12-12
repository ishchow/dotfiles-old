" Load plugins
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc-nvim.vim

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Palenight theme settings
set background=dark
colorscheme palenight

" Lightline settings
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
