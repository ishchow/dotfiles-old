" auto-install minpac
" auto-install plugpac
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall 
endif

call plug#begin(stdpath('data') . '/plugged')
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
