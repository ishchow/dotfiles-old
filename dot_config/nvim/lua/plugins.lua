local use = require('packer').use

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- #### Colorschemes ####
    -- use 'morhetz/gruvbox'
    -- use 'arcticicestudio/nord-vim'
    -- use 'mhartington/oceanic-next'
    use 'sainnhe/sonokai'
    -- use 'sainnhe/edge'
    -- use 'glepnir/zephyr-nvim'
    -- use 'ChristianChiarulli/nvcode-color-schemes.vim'
    -- #### Colorschemes ####

    -- #### Editing ####
    use 'tomtom/tcomment_vim' -- Comments
    use 'machakann/vim-sandwich' -- Quotes/Paranthesizing
    use 'jiangmiao/auto-pairs' -- Automatically add pairs for code punctuation
    use 'unblevable/quick-scope' -- Highlight unique characters in line for easy f/F
    -- #### Editing ####

    -- #### Cosmetic Stuff ####
    use 'Yggdroot/indentLine' -- Display thin vertical lines for indents
    use 'itchyny/lightline.vim' -- Status bar
    -- #### Cosmetic Stuff ####

    -- #### Git ####
    use 'lambdalisue/gina.vim' -- Async control of git repos (similar to vim-fugitive)
    use 'airblade/vim-gitgutter' -- Git gutter
    -- #### Git ####

    -- #### Search ####
    use 'haya14busa/is.vim' -- Automatically clear search highlight after cursor moves
    use 'nelstrom/vim-visual-star-search' -- Modify * to also work with visual selections.
    use 'mhinz/vim-grepper' -- Handle multi-file find and replace.
    use 'LoricAndre/fzterm.nvim' -- Open fzf in floating window
    -- #### Search ####

    -- #### Misc ####
    use 'https://gitlab.com/dbeniamine/todo.txt-vim' -- Todo txt plugin
    use 'voldikss/vim-floaterm' -- Create floating terminals
    use '~/projects/nvim-deardiary' -- Journal Plugin
    use 'vitalk/vim-simple-todo' -- Work with markdown lists
    -- #### Misc ####

    -- #### Writing ####
    use 'reedes/vim-pencil' -- Line wrapping for prose
    use 'reedes/vim-lexical' -- Convenience plugin over built-in vim completion
    use 'junegunn/goyo.vim' -- Distraction free writing
    use 'junegunn/limelight.vim' -- Focus only on current paragraph
    use 'vim-voom/VOoM' -- Two pane outliner for markup/markdown files
    -- #### Writing ####

    -- #### Syntax Highlighting ####
    use 'lepture/vim-jinja' -- Jinja/Nunjucks Template Highlighting
    -- #### Syntax Highlighting ####

    -- #### Snippets ####
    use 'hrsh7th/vim-vsnip' -- LSP snippets
    -- #### Snippets ####

    -- #### Lua Rocks ####
    use_rocks 'penlight' -- Useful lua modules
    -- #### Lua Rocks ####

    if vim.fn.has('nvim-0.5') then
        -- #### LSP ####
        use 'neovim/nvim-lspconfig' -- Configs for lsp servers
        use 'glepnir/lspsaga.nvim' -- Improve LSP UI
        use 'kosayoda/nvim-lightbulb' -- Show lightbulb in sign column if code action available at cursor
        -- #### LSP ####

        -- #### Autocomplete ####
        use 'hrsh7th/nvim-compe' -- Completion engine
        -- #### Autocomplete ####

        -- #### Treesitter ####
        use 'nvim-treesitter/nvim-treesitter' -- Treesitter highlighting and config
        -- #### Treesitter ####

        -- #### DAP ####
        -- use 'mfussenegger/nvim-dap'
        -- use 'theHamsta/nvim-dap-virtual-text'
        -- use 'mfussenegger/nvim-dap-python'
        -- #### DAP ####
    end
end)
