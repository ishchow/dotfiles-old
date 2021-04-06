if has("nvim-0.5")
    lua require("diary")
endif

augroup deardiary
    autocmd!
    autocmd VimEnter * lua require("deardiary").set_current_journal_cwd()
augroup end
