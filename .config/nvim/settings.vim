set number                     " Show current line number
set relativenumber             " Show relative line numbers
set clipboard+=unnamedplus     " Yank to system clipboard
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " Set tab to spaces, tab width 4
let mapleader=","              " Sets <Leader> to ,
let maplocalleader = "\\"      " Sets <LocalLeader> to \
set autoread                   " Automatically refreshes files

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

" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete

" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>

" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>

" Jinja/Nunjucks syntax highlighting
" au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.njk set ft=jinja
call tcomment#type#Define('nunjucks', '{# %s#}')
au BufNewFile,BufRead *.njk setf nunjucks

" Set true colors
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set Colorscheme
syntax on
" set background=dark
colorscheme nord

" Lightline configuration
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }

" Show vertical line for code indented with tabs
set list lcs=tab:\|\ " (here is a space)

" .............................................................................
" voldikss/vim-floaterm
" .............................................................................
nnoremap <Leader>n :FloatermNew fff<CR>

" .............................................................................
" fzterm.nvim
" .............................................................................
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>

let g:fzterm_width_ratio = "0.85"
let g:fzterm_height_ration = "0.85"

" .............................................................................
" mhinz/vim-grepper
" .............................................................................
let g:grepper={}
let g:grepper.tools=["rg"]

" .............................................................................
" vimwiki/vimwiki
" .............................................................................

" Don't treat all *.md files as a vimwiki
let g:vimwiki_global_ext = 0
" Disable url shortening
let g:vimwiki_url_maxsave=0

let g:vimwiki_list = [
    \ {'path': '~/wikis/dev', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/wikis/personal', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/wikis/work', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/wikis/music', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/wikis/writing', 'syntax': 'markdown', 'ext': '.md'},
    \ ]

augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks

    au BufNewFile */diary/[0-9]*.md 0r !~/.config/nvim/bin/create-vimwiki-diary-entry '%'
augroup end

" let g:vimwiki_list = [wiki_1]

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
    \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
