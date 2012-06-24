## Install

Just use the bootstrap script to update the repos, copy all files to
`~/.vim`, symlink rc files and compile and plugins that require native
extensions (like command-t).

    $ ./bootstrap.sh

### Pre Reqs

This assumes you're using _Vim 7.3_. OS X 10.6 ships with Vim 7.2, but
you can just use MacVim [by symlinking to the mvim
binary][mvim].

### Plugins as submodules

This config uses [Pathogen][pathogen] and git submodules for plugin
management: [List of all plugins][plugins].

### Extending

Any additional configurations will be loaded from `~/.vimrc.local` and
`~/.gvimrc.local`.

[mvim]: http://www.michaelbarton.me.uk/research/2010/11/getting-the-terminal-version-of-vim-7-3-to-work-on-osx-10-6/
[pathogen]: https://github.com/tpope/vim-pathogen
[plugins]: https://github.com/wookiehangover/vim-config/tree/master/bundle

