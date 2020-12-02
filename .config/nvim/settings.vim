set number                     " Show current line number
set relativenumber             " Show relative line numbers
set clipboard+=unnamedplus     " Yank to system clipboard
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " Set tab to spaces, tab width 4
let mapleader=","              " Sets <Leader> to ,
let maplocalleader = "\\"      " Sets <LocalLeader> to \
set autoread                   " Automatically refreshes files
set conceallevel=0             " Prevents * and _ from being concealed in Markdown
set updatetime=750             " Mostly for vim-gitgutter

"Press * to search for the term under the cursor or a visual selection and
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

" .............................................................................
" nvim-lua/completion-nvim
" .............................................................................
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab as completion trigger key
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Change completion source
imap <c-j> <Plug>(completion_next_source)
imap <c-k> <Plug>(completion_prev_source)

" Automatically change completion source when current source has no
" completions available
let g:completion_auto_change_source = 1

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c"

" Don't trigger completion for short words
let g:completion_trigger_keyword_length = 3

" Chain completion list
let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'snippet, path']},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}

" .............................................................................
" theHamsta/nvim-dap-virtual-text
" .............................................................................
let g:dap_virtual_text = 1

".............................................................................
" voldikss/vim-floaterm
" .............................................................................
nnoremap <Leader>n :FloatermNew fff<CR>

" .............................................................................
" fzterm.nvim
" .............................................................................
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>

let g:fzterm_width_ratio = "0.85"
let g:fzterm_height_ratio = "0.85"

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
let g:vimwiki_url_maxsave = 0
" Disable folding
let g:vimwiki_folding = ''
" Disable conceal
let g:vimwiki_conceallevel = 0

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

nnoremap <Leader>x :VimwikiToggleListItem<CR>

" .............................................................................
" reedes/vim-lexical
" .............................................................................
" Don't mark URL-like things as spelling errors
syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell

" Don't count acronyms / abbreviations as spelling errors
" (all upper-case letters, at least three characters)
" Also will not count acronym with 's' at the end a spelling error
" Also will not count numbers that are part of this
" Recognizes the following as correct:
syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

let g:lexical#spell = 1 
let g:lexical#spelllang = ['en_us']
let g:lexical#dictionary = ['/usr/share/dict/american']
let g:lexical#spellfile = ['~/.config/nvim/spell/en.utf-8.add',]
" let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/moby.txt']

augroup lexical
    autocmd!
    autocmd FileType markdown,vimwiki,text,gitcommit call lexical#init()
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
    autocmd FileType markdown,vimwiki call SetPencilOptions()
    autocmd FileType text call pencil#init()
augroup end

" .............................................................................
" vim-voom/voom
" .............................................................................
let g:voom_ft_modes = {'markdown': 'markdown', 'vimwiki': 'markdown'}
let g:voom_default_mode = 'markdown'

" .............................................................................
" junegunn/goyo.vim
" .............................................................................
function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    " set noshowmode
    " set noshowcmd
    " set scrolloff=999
    
    " Effectively disable autocomplete as you type
    let g:completion_trigger_keyword_length = 999
    call lexical#init({'thesaurus': ['~/.config/nvim/thesaurus/moby.txt']})
    Limelight
endfunction
                      "
function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    " set showmode
    " set showcmd
    " set scrolloff=5
    
    " Renable autocomplete as type
    let g:completion_trigger_keyword_length = 3
    call lexical#init()
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
