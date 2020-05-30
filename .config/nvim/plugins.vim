" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall 
endif

call plug#begin(stdpath('data') . '/plugged')
    " #### Colorschemes ####
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    
    " #### Cosmetic Stuff ####
    " Display thin vertical lines for indents
    Plug 'Yggdroot/indentLine'
    
    " Status bar
    Plug 'itchyny/lightline.vim'
    
    " #### Language Servers and Syntax Highlighting ####
    " Language servers and other vscode like extensions
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Extra syntax highlighting for toml
    Plug 'cespare/vim-toml'

    " Jinja/Nunjucks Template Highlighting
    Plug 'lepture/vim-jinja'

    " #### Search ####
    " Automatically clear search highlight after cursor moves
    Plug 'haya14busa/is.vim'

    " Modify * to also work with visual selections.
    Plug 'nelstrom/vim-visual-star-search'
   
    " Handle multi-file find and replace.
    Plug 'mhinz/vim-grepper'
    
    " fzf: fuzzy search
    " Used by fzf-preview
    Plug '~/.fzf'

    " Preview fzf search results in floating window
    Plug 'yuki-ycino/fzf-preview.vim'

    " #### Other ####
    " Allow vim to open file at specific line
    " Needed by fzf-preview
    Plug 'wsdjeg/vim-fetch'

    " Comments
    Plug 'tomtom/tcomment_vim'

    " Jump to line on quickfix window
    " Needed by fzf-preview
    Plug 'rbtnn/vim-jumptoline'
    "
    " Quotes/Paranthesizing
    Plug 'tpope/vim-surround'

    " Todo txt plugin 
    Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'

    " Create floating terminals
    Plug 'voldikss/vim-floaterm'
call plug#end()

