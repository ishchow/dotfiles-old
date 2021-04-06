".............................................................................
" voldikss/vim-floaterm
" .............................................................................
nnoremap <Leader>n :FloatermNew fff<CR>
nnoremap <silent> <Leader>t :FloatermToggle<CR>
tnoremap <silent> <Leader>t <C-\><C-n>:FloatermToggle<CR>

let g:floaterm_height = 0.85
let g:floaterm_width = 0.85
