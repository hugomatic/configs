" The following might be needed when using vi, instead of vim
set nocompatible
set backspace=2

" Automatically remove all trailing whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

" Keep cursor in the middle of screen
" set scrolloff=50

" Tab to white space
set tabstop=2 shiftwidth=2 expandtab

" highlight search
set hlsearch

" tab completion
set wildmenu

" copy up to 1000 lines
set viminfo='20,<1000

