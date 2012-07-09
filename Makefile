VIM=${HOME}/.vim
DATE=$(shell date +%Y%m%d%H%m)

copy:
	@rsync -v ${VIM}/vimrc vimrc
	@rsync -v ${VIM}/gvimrc vimrc

archive:
	tar czvf ~/vim_backup_${DATE}.tar.gz ${VIM}
