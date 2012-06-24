#! /bin/bash

cd "$(dirname "$0")"

echo "Updating Repo..."
git pull
git submodule init
git submodule update

echo

function doIt() {

  echo "Cleaning up previous .vim files..."
  rm ~/.gvimrc
  rm ~/.vimrc
  rm -rf ~/.vim

  echo "Creating ~/.vim"
  mkdir ~/.vim
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "readme.md" --exclude ".gitkeep" -a . ~/.vim

  echo "Symlinking config files..."
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc

  echo "Building command-t..."
  cd ~/.vim/bundle/command-t
  /usr/bin/rake make

  echo

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
