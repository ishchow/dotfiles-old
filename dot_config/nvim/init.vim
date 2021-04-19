set number                     " Show current line number
set relativenumber             " Show relative line numbers
set clipboard+=unnamedplus     " Yank to system clipboard
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " Set tab to spaces, tab width 4
let mapleader=","            " Sets <Leader>
let maplocalleader="\\"      " Sets <LocalLeader>
set autoread                   " Automatically refreshes files
set conceallevel=0             " Prevents * and _ from being concealed in Markdown
set updatetime=750             " Mostly for vim-gitgutter
set diffopt=vertical           " Always make diff split vertically
set hidden                     " Prevent having to safe buffer when switching between buffers
set completeopt=menu,menuone,noselect " Use popup menu, show menu even if only one element, force user to select match
set exrc                       " Project specific vimrc
set noerrorbells               " Don't beep or flash screen for error messages
set noswapfile                 " Disable swapfile
set nobackup                   " Don't use backups
let &undodir=stdpath('data') . '/undodir' " Set undo directory
set undofile                   " Use undofile
set incsearch                  " Incrementally highlight terms when searching
set scrolloff=8                " Scroll before hitting bottom/stop of screen
set colorcolumn=80,120         " Set colorcolumns at 80 and 120 characters

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" .............................................................................
" colorscheme 
" .............................................................................
" Set true colors
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set Colorscheme
syntax on
syntax enable
colorscheme sonokai

" .............................................................................
" Trim trailing whitespace
" .............................................................................
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
nnoremap <Leader>w :call TrimWhitespace()<CR>
