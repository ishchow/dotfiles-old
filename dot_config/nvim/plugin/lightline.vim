" .............................................................................
" tchyny/lightline.vim
" .............................................................................
let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }

" Show vertical line for code indented with tabs
set list lcs=tab:\|\ " (here is a space)

