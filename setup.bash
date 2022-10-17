#!/usr/bin/env bash

email="hugo@hugomatic.ca"
if [ -z "$1" ]
  then
    echo "no email supplied"
  else
    email=$1
fi

echo "your email: $email"

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

vimrc="$HOME/.vimrc"

write_vimrc() {

cat <<DELIM > $vimrc

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

" show file name in terminal
set title

" 80 character column marker
set colorcolumn=81

DELIM

}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "DIR: $DIR"

packs="vim tmux tree terminator ipython3 python3-pip git openssh-server"
confirm "install $packs?" && sudo apt install -y $packs

confirm "setup git user/email (hugomatic/$email)?"  \
  && git config --global user.email "$email" \
  && git config --global user.name "hugomatic" \
  && git config --global credential.helper cache \
  && git config --global credential.helper 'cache --timeout=14400'

# confirm "write $vimrc?" && cp $DIR/vimrc $vimrc
confirm "write $vimrc?" && write_vimrc

confirm "install node 18?" && curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install -y nodejs

confirm "install vcstool (requires pip3)?" && pip3 install vcstool

confirm "silence terminal bell?" && echo "set bell-style none" >> ~/.inputrc
