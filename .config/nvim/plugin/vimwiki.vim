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

