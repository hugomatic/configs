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

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "DIR: $DIR"

vimrc="$HOME/.vimrc"

confirm "install vim tmux ipython3?" && sudo apt install vim tmux ipython3

confirm "setup git user/email (hugomatic/$email)?"  \
  && git config --global user.email "$email" \
  && git config --global user.name "hugomatic" \
  && git config --global credential.helper cache \
  && git config --global credential.helper 'cache --timeout=3600'

confirm "replace $vimrc?" && cp $DIR/vimrc $vimrc




# read -r -p "copy \"$DIR/vimrc\" to \"$vimrc\"? [y/N] " response
# response=${response,,}    # tolower
# if [[ "$response" =~ ^(yes|y)$ ]]
# then
#   cp $DIR/vimrc $vimrc
#   stat $vimrc
# else
#   echo "skipping vimrc"
# fi
