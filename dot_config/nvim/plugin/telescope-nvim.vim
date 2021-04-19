" .............................................................................
" telescope.nvim
" .............................................................................
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').grep_string{ only_sort_text = true, search = vim.fn.input("Grep For >") }<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

