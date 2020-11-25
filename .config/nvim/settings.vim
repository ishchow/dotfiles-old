set number                     " Show current line number
set relativenumber             " Show relative line numbers
set clipboard+=unnamedplus     " Yank to system clipboard
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " Set tab to spaces, tab width 4
let mapleader=","              " Sets <Leader> to ,
let maplocalleader = "\\"      " Sets <LocalLeader> to \
set autoread                   " Automatically refreshes files
set conceallevel=0             " Prevents * and _ from being concealed in Markdown

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

" .............................................................................
" tchyny/lightline.vim
" .............................................................................

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
" spellcheck (built-in)
" .............................................................................

" Don't mark URL-like things as spelling errors
syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell

" Don't count acronyms / abbreviations as spelling errors
" (all upper-case letters, at least three characters)
" Also will not count acronym with 's' at the end a spelling error
" Also will not count numbers that are part of this
" Recognizes the following as correct:
syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

" Spellcheck
set spelllang=en_us
set spellfile=~/.config/nvim/spell/en.utf-8.add

autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType vimwiki setlocal spell

" Spell check dictionary and complete
set dictionary+=/usr/share/dict/american
set complete+=k
set complete+=kspell

" .............................................................................
" nvim-lua/completion-nvim
" .............................................................................
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c"

" Chain completion list
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

" Automatically change completion source when current source has no
" completions available
let g:completion_auto_change_source = 1

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

" .............................................................................
" vimwiki/vimwiki
" .............................................................................

" Don't treat all *.md files as a vimwiki
let g:vimwiki_global_ext = 0
" Disable url shortening
let g:vimwiki_url_maxsave=0
" Disable folding
let g:vimwiki_folding= ''

let g:vimwiki_list = [
    \ {'path': '~/wikis/default/dev', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/wikis/default/personal', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/wikis/default/music', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/wikis/default/writing', 'syntax': 'markdown', 'ext': '.md'},
\ ]

augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks

    au BufNewFile */diary/[0-9]*.md 0r !~/.config/nvim/bin/create-vimwiki-diary-entry '%'
augroup end

" .............................................................................
" reedes/vim-pencil
" .............................................................................
let g:pencil#autoformat_config = {
      \   'markdown': {
      \     'black': [
      \       'htmlH[0-9]',
      \       'markdown(Code|H[0-9]|Url|IdDeclaration|Link|Rule|Highlight[A-Za-z0-9]+)',
      \       'markdown(FencedCodeBlock|InlineCode)',
      \       'mkd(Code|Rule|Delimiter|Link|ListItem|IndentCode)',
      \       'mmdTable[A-Za-z0-9]*',
      \     ],
      \     'white': [
      \      'markdown(Code|Link)',
      \     ],
      \   },
      \   'vimwiki': {
      \     'black': [
      \       'htmlH[0-9]',
      \       'markdown(Code|H[0-9]|Url|IdDeclaration|Link|Rule|Highlight[A-Za-z0-9]+)',
      \       'markdown(FencedCodeBlock|InlineCode)',
      \       'mkd(Code|Rule|Delimiter|Link|ListItem|IndentCode)',
      \       'mmdTable[A-Za-z0-9]*',
      \     ],
      \     'white': [
      \      'markdown(Code|Link)',
      \     ],
      \   },
      \ }

function SetPencilOptions()
    call pencil#init({ 'wrap': 'soft' })
    set textwidth=80
    set colorcolumn=80
endfunction

augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,vimwiki call SetPencilOptions()
    autocmd FileType text         call pencil#init()
    " autocmd FileType markdown,mkd,vimwiki call pencil#init()
augroup end

" .............................................................................
" vim-voom/voom
" .............................................................................
let g:voom_ft_modes = {'markdown': 'markdown', 'vimwiki': 'markdown'}
let g:voom_default_mode = 'markdown'

" .............................................................................
" airblade/vim-gitgutter
" .............................................................................
set updatetime=100
