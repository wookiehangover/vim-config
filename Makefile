VIM=${HOME}/.vim
DATE=$(shell date +%Y%m%d%H%M)

build:
	make dirs
	make links
	make command-t

dirs:
	mkdir -p ${VIM}/undo
	mkdir -p ${VIM}/swap
	mkdir -p ${VIM}/backup

links:
	rm ~/.vimrc
	rm ~/.gvimrc
	ln -s vimrc ~/.vimrc
	ln -s gvimrc ~/.gvimrc

command-t:
	cd ~/.vim/bundle/command-t && /usr/bin/rake make

archive:
	tar czvf ~/vim_backup_${DATE}.tar.gz ~/.vim

