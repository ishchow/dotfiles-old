" auto-install minpac
try
    packadd minpac
catch    
    exe '!git clone https://github.com/k-takata/minpac.git ' stdpath('config').'/pack/minpac/opt/minpac'
endtry

" auto-install plugpac
if empty(glob('~/.config/nvim/autoload/plugpac.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plugpac.vim --create-dirs
            \ https://raw.githubusercontent.com/bennyyip/plugpac.vim/master/plugpac.vim
    autocmd VimEnter * PackInstall | source init.vim
endif

call plugpac#begin()
    Pack 'k-takata/minpac', {'type': 'opt'}
call plugpac#end()
