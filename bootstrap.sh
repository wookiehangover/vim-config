#! /bin/bash

cd "$(dirname "$0")"

function doIt() {

  make archive

  if [ -d ~/.vim/.git ]; then
    cd ~/.vim
    git pull origin master
    git submodule init
    git submodule update
  else
    rm -rf ~/.vim
    git clone --recursive git@github.com:wookiehangover/vim-config.git ~/.vim
    # echo "Creating ~/.vim"
    # mkdir ~/.vim
    # rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "readme.md" --exclude ".gitkeep" --exclude "Makefile" -a . ~/.vim
  fi

  make build

  echo "Vimfiles successfully installed!"

}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This will REMOVE any pre-existing vim files. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi

unset doIt
