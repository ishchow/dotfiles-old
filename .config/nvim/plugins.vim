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
    " #### Colorschemes ####

    " #### Editing ####
    " Comments
    Plug 'tomtom/tcomment_vim'
    " Quotes/Paranthesizing
    Plug 'machakann/vim-sandwich'
    " #### Editing ####

    " #### Cosmetic Stuff ####
    " Display thin vertical lines for indents
    Plug 'Yggdroot/indentLine'
    
    " Status bar
    Plug 'itchyny/lightline.vim'
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
    Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'

    " Create floating terminals
    Plug 'voldikss/vim-floaterm'

    " Note taking and wiki
    Plug 'vimwiki/vimwiki'
    " #### Misc ####"

    " #### Syntax Highlighting ####
    " Jinja/Nunjucks Template Highlighting
    Plug 'lepture/vim-jinja'
    " #### Syntax Highlighting ####
call plug#end()
