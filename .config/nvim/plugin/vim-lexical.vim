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

