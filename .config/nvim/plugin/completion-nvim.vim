if has('nvim-0.5')
    lua require("lsp")
    
    " .............................................................................
    " nvim-lua/completion-nvim
    " .............................................................................
    " Use completion-nvim in every buffer
    autocmd BufEnter * lua require'completion'.on_attach()

    " Use <Tab> and <S-Tab> to navigate through popup menu
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " Use tab as completion trigger key
    imap <Tab> <Plug>(completion_smart_tab)
    imap <S-Tab> <Plug>(completion_smart_s_tab)

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
endif

