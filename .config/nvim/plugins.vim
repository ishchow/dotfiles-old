" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall 
endif

call plug#begin(stdpath('data') . '/plugged')
    if has('nvim-0.5')
        " ### LSP ###
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-lua/completion-nvim'
        Plug 'nvim-lua/diagnostic-nvim'
    endif

    " #### Colorschemes ####
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    
    " #### Cosmetic Stuff ####
    " Display thin vertical lines for indents
    Plug 'Yggdroot/indentLine'
    
    " Status bar
    Plug 'itchyny/lightline.vim'
    
    " Jinja/Nunjucks Template Highlighting
    Plug 'lepture/vim-jinja'

    " #### Search ####
    " Automatically clear search highlight after cursor moves
    Plug 'haya14busa/is.vim'

    " Modify * to also work with visual selections.
    Plug 'nelstrom/vim-visual-star-search'
   
    " Handle multi-file find and replace.
    Plug 'mhinz/vim-grepper'

    " Fzf
    " Plug '~/.fzf'

    " Open fzf in floating window
    Plug 'https://github.com/LoricAndre/fzterm.nvim'

    " Comments
    Plug 'tomtom/tcomment_vim'

    " Quotes/Paranthesizing
    Plug 'tpope/vim-surround'

    " Todo txt plugin 
    Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'

    " Create floating terminals
    Plug 'voldikss/vim-floaterm'
call plug#end()
