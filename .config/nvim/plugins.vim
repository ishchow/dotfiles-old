" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall 
endif

call plug#begin(stdpath('data') . '/plugged')
    if has('nvim-0.5')
        " #### LSP ####
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-lua/completion-nvim'
        " #### LSP ####

        " #### Treesitter ####
        Plug 'nvim-treesitter/nvim-treesitter'
        " #### Treesitter ####
        
        " #### DAP ####
        Plug 'mfussenegger/nvim-dap'
        Plug 'theHamsta/nvim-dap-virtual-text'
        Plug 'mfussenegger/nvim-dap-python'
        " #### DAP ####
    endif

    " #### Colorschemes ####
    " Plug 'morhetz/gruvbox'
    " Plug 'arcticicestudio/nord-vim'
    " Plug 'mhartington/oceanic-next'
    Plug 'sainnhe/sonokai'
    " Plug 'sainnhe/edge'
    " Plug 'glepnir/zephyr-nvim'
    " Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
    " #### Colorschemes ####

    " #### Editing ####
    " Comments
    Plug 'tomtom/tcomment_vim'
    " Quotes/Paranthesizing
    Plug 'machakann/vim-sandwich'
    " Automatically add pairs for code punctuation
    Plug 'jiangmiao/auto-pairs'
    " Jumping to location specified by two characters
    Plug 'justinmk/vim-sneak'
    " #### Editing ####

    " #### Cosmetic Stuff ####
    " Display thin vertical lines for indents
    Plug 'Yggdroot/indentLine'
    " Status bar
    Plug 'itchyny/lightline.vim'
    " Git gutter
    Plug 'airblade/vim-gitgutter'
    " #### Cosmetic Stuff ####
    
    " #### Search ####
    " Automatically clear search highlight after cursor moves
    Plug 'haya14busa/is.vim'
    " Modify * to also work with visual selections.
    Plug 'nelstrom/vim-visual-star-search'
    " Handle multi-file find and replace.
    Plug 'mhinz/vim-grepper'
    " Open fzf in floating window
    Plug 'LoricAndre/fzterm.nvim'
    " #### Search ####
 
    " #### Misc ####"
    " Todo txt plugin 
    Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'
    " Create floating terminals
    Plug 'voldikss/vim-floaterm'
    " Note taking and wiki
    Plug 'vimwiki/vimwiki'
    " #### Misc ####"

    " #### Writing ####
    " Line wrapping for prose
    Plug 'reedes/vim-pencil' 
    " Convenience plugin over built-in vim completion 
    Plug 'reedes/vim-lexical'
    " Distraction free writing
    Plug 'junegunn/goyo.vim'
    " Focus only on current paragraph
    Plug 'junegunn/limelight.vim'
    " Two pane outliner for markup/markdown files
    Plug 'vim-voom/VOoM'
    " #### Writing ####

    " #### Syntax Highlighting ####
    " Jinja/Nunjucks Template Highlighting
    Plug 'lepture/vim-jinja'
    " #### Syntax Highlighting ####
call plug#end()
