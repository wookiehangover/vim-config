VIM=${HOME}/.vim
DATE=$(shell date +%Y%m%d%H%m)

build:
	make archive
	sh ./bootstrap.sh

copy:
	@rsync -v ${VIM}/vimrc vimrc
	@rsync -v ${VIM}/gvimrc gvimrc

archive:
	tar czvf ~/vim_backup_${DATE}.tar.gz ${VIM}

