### Pre Reqs

This assumes you're using _Vim 7.3_. OS X still ships with Vim 7.2, but
you can install it [via homebrew][homebrew] or [by symlinking to the mvim
binary][mvim].

### Install

    # make directories and clone repo
    mkdir ~/.vim ~/.vim/backup
    git clone --recursive git@github.com:wookiehangover/vim-config.git ~/.vim

    # symlink config files
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

In order to make the Command-T plugin work, you'll need a working ruby
environment. _If you're using rvm_, you should run `$ rvm use system`
first. Then build Command-T like this:

    cd ~/.vim/bundle/command-t
    gem install bundler # skip this step if you've already got bundler installed
    bundle install
    rake make

And that's it. Happy Vim'ing.

### Plugins as submodules

This config uses [Pathogen][pathogen] and git submodules for plugin
management. [Click here][plugins] for a list of all of the plugins.

### Updates

To update the submodules, just checkout with

    $ git submodule foreach git pull origin master


[homebrew]: https://gist.github.com/721952/0b2428d75052548b90e9b1d28553f4c9f56f8a0a
[mvim]: http://www.michaelbarton.me.uk/research/2010/11/getting-the-terminal-version-of-vim-7-3-to-work-on-osx-10-6/
[pathogen]: https://github.com/tpope/vim-pathogen
[plugins]: https://github.com/wookiehangover/vim-config/tree/master/bundle
