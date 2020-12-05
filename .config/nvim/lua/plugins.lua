local use = require('packer').use

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    if vim.fn.has('nvim-0.5') then
        -- #### LSP ####
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/completion-nvim'
        -- #### LSP ####

        -- #### Treesitter ####
        use 'nvim-treesitter/nvim-treesitter'
        -- #### Treesitter ####

        -- #### DAP ####
        use 'mfussenegger/nvim-dap'
        use 'theHamsta/nvim-dap-virtual-text'
        use 'mfussenegger/nvim-dap-python'
        -- #### DAP ####
    end

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
    -- Comments
    use 'tomtom/tcomment_vim'
    -- Quotes/Paranthesizing
    use 'machakann/vim-sandwich'
    -- Automatically add pairs for code punctuation
    use 'jiangmiao/auto-pairs'
    -- Jumping to location specified by two characters
    -- use 'justinmk/vim-sneak'
    -- #### Editing ####

    -- #### Cosmetic Stuff ####
    -- Display thin vertical lines for indents
    use 'Yggdroot/indentLine'
    -- Status bar
    use 'itchyny/lightline.vim'
    -- Git gutter
    use 'airblade/vim-gitgutter'
    -- #### Cosmetic Stuff ####

    -- #### Search ####
    -- Automatically clear search highlight after cursor moves
    use 'haya14busa/is.vim'
    -- Modify * to also work with visual selections.
    use 'nelstrom/vim-visual-star-search'
    -- Handle multi-file find and replace.
    use 'mhinz/vim-grepper'
    -- Open fzf in floating window
    use 'LoricAndre/fzterm.nvim'
    -- #### Search ####

    -- #### Misc ####--
    -- Todo txt plugin
    use 'https://gitlab.com/dbeniamine/todo.txt-vim'
    -- Create floating terminals
    use 'voldikss/vim-floaterm'
    -- Note taking and wiki
    use 'vimwiki/vimwiki'
    -- #### Misc ####--

    -- #### Writing ####
    -- Line wrapping for prose
    use 'reedes/vim-pencil'
    -- Convenience plugin over built-in vim completion
    use 'reedes/vim-lexical'
    -- Distraction free writing
    use 'junegunn/goyo.vim'
    -- Focus only on current paragraph
    use 'junegunn/limelight.vim'
    -- Two pane outliner for markup/markdown files
    use 'vim-voom/VOoM'
    -- #### Writing ####

    -- #### Syntax Highlighting ####
    -- Jinja/Nunjucks Template Highlighting
    use 'lepture/vim-jinja'
    -- #### Syntax Highlighting ####
end)
