VIM=${HOME}/.vim
DATE=$(shell date +%Y%m%d%H%M)

all: dirs links

dirs:
	mkdir -p ${VIM}/undo
	mkdir -p ${VIM}/swap
	mkdir -p ${VIM}/backup

links:
	rm ~/.vimrc
	rm ~/.gvimrc
	ln -s vimrc ~/.vimrc
	ln -s gvimrc ~/.gvimrc

archive:
	tar czvf ~/vim_backup_${DATE}.tar.gz ~/.vim

clean:
	find ${VIM}/swap -name \*.swp -delete

.PHONY: clean all
