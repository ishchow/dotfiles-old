" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall 
endif

call plug#begin(stdpath('data') . '/plugged')
    " #### Colorschemes ####
    Plug 'morhetz/gruvbox'
    Plug 'mhartington/oceanic-next'
    Plug 'rakr/vim-one'
    Plug 'arcticicestudio/nord-vim'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'drewtempelmeyer/palenight.vim'

    " Display thin vertical lines for indents
    Plug 'Yggdroot/indentLine'

    " Status bar
    Plug 'itchyny/lightline.vim'

    " Language servers and other vscode like extensions
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Extra syntax highlighting for toml
    Plug 'cespare/vim-toml'

    " Comments
    Plug 'tomtom/tcomment_vim'

    " Automatically clear search highlight after cursor moves
    Plug 'haya14busa/is.vim'

    " Modify * to also work with visual selections.
    Plug 'nelstrom/vim-visual-star-search'
   
    " Handle multi-file find and replace.
    Plug 'mhinz/vim-grepper'

    " Quotes/Paranthesizing
    Plug 'tpope/vim-surround'

    " Todo txt plugin 
    Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'
    
    " File Explorer
    Plug 'preservim/nerdtree'    
    
    " fzf: fuzzy search
    Plug '~/.fzf'

    " Preview fzf search results in floating window
    Plug 'yuki-ycino/fzf-preview.vim'

    " Dev icons
    Plug 'ryanoasis/vim-devicons'

    " Allow vim to open file at specific line
    Plug 'wsdjeg/vim-fetch'

    " Jump to line on quickfix window
    Plug 'rbtnn/vim-jumptoline'
call plug#end()

