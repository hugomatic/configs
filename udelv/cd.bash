#!/usr/bin/env bash

# mounts disk if the directory is not present. needs sudo

code="/media/hugo/Space/code"
if stat $code;
then
  echo "disk already mounted"
else
  sudo mount /dev/sdb3 /media/hugo/Space
  cd ~
  ln -s /media/hugo/Space/code code
  ln -s /media/hugo/Space/dev dev
  ln -s /media/hugo/Space/install install
fi

# this should go through the link
cd ~/code
