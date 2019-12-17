" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall 
endif

call plug#begin(stdpath('data') . '/plugged')
    " Colorscheme
    Plug 'morhetz/gruvbox'

    " Status bar
    Plug 'itchyny/lightline.vim'

    " Language servers and other vscode like extensions
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Extra syntax highlighting for toml
    Plug 'cespare/vim-toml'
call plug#end()

