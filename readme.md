### Install

    $ git clone --recursive git@github.com:wookiehangover/vim-config.git
    ...
    $ mkdir ~/.vim
    $ mkdir ~/.vim/backup
    $ ln -s /path/to/vim-config ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ ln -s ~/.vim/gvimrc ~/.gvimrc

In order to make the Command-T plugin work, you'll need a working ruby
environment. If you're using rvm, you should run `$ rvm use system`
first. Then build Command-T like this:

    $ cd ~/.vim/bundle/command-t
    $ gem install bundler # skip this step if you've already got bundler installed
    $ bundle install
    ...
    $ rake make

And that's it. Happy Vim'ing.

### Updates

To update the submodules, just checkout with

    $ git submodule foreach git pull origin master
