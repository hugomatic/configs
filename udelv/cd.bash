#!/usr/bin/env bash

# mounts disk if the directory is not present. needs sudo



code="/media/hugo/Space/code"
if stat $code;
then
  echo "disk already mounted"
else
  sudo mount /dev/sdb3 /media/hugo/Space
  cd ~
fi

if [ ! -L $HOME/code ]; then
  ln -s /media/hugo/Space/code $HOME/code
fi
if [ ! -L $HOME/dev ]; then
  ln -s /media/hugo/Space/code $HOME/dev
fi
if [ ! -L $HOME/local ]; then
  ln -s /media/hugo/Space/local $HOME/local
fi

# this should go through the link
# cd ~/code
