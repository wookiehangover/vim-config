"""
" GENERAL SETTINGS
"""
color elflord

set nocompatible
set lazyredraw
set ttyfast

set number
set ruler
syntax on

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\∴\ ,trail:·

set autoindent " Copy indent from last line when starting new line.
set hidden " When a buffer is brought to foreground, remember undo history and marks.

set cursorline " Highlight current line

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=3

set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

set mouse=a " Enable moouse in all in all modes.
set nostartofline " Don't reset cursor to start of line when moving around.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set splitbelow " New window goes below
set splitright " New windows goes right

set showmode " Show the current mode.
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js,smarty/**,vendor/**,node_libraries/**,.git,.hg,.svn,.sass-cache,log,tmp,build,**/ckeditor/**
set wildmenu " Hitting TAB in command mode will show possible completions above command line.

set wrapscan " Searches wrap around end of file

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Status bar
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways
set hidden " When a buffer is brought to foreground, remember undo history and marks.

" Use modeline overrides
set modeline
set modelines=10

"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

set undofile
set undodir=~/.vim/backup

" xterm not recognized right by vi
set term=builtin_ansi

set noerrorbells
set visualbell

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>




"""
" PATHOGEN
"""
filetype off
call pathogen#infect()
syntax on
filetype plugin indent on




"""
" PLUGIN CONFIG
"""

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20


" SuperTab
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabCrMapping = 0
let g:SuperTabCompletionType = "context"
au BufEnter,BufRead,BufNewFile *.html,*.md,*.erb let g:SuperTabMappingForward = '<s-tab>'
au BufLeave *.html,*.erb let g:SuperTabMappingForward = '<tab>'

" Markdown
augroup mkd
  autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:>
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript
" Jade
au BufRead,BufNewFile *.jade set ft=jade syntax=jade
" JST
au BufRead,BufNewFile *.jst set syntax=jst
" Less
au BufNewFile,BufRead *.less set filetype=less
" Common Ruby files
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

" Command-T
let g:CommandTMaxFiles=20000
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=12
let g:CommandTCancelMap=['<Esc>', '<C-c>']

" Sparkup
"let g:sparkupNextMapping=''

" Coffeescript.vim
"autocmd BufWritePost *.coffee CoffeeMake! -b
"let coffee_folding = 1

" Syntastic 
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*




"""
" FORMATTING
"""

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.txt call s:setupWrapping()




"""
" KEY MAPPINGS
"""

" exit to normal mode with 'jj'
inoremap jj <ESC>

" Change mapleader
let mapleader=","

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l


" Buffer navigation (,,) (,]) (,[) (,ls)
map <Leader>, <C-^>
map <Leader>] :bnext<CR>
map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>

" Remap keys for auto-completion, disable arrow keys
"inoremap <expr>  <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr>  <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr>  <Down>     pumvisible() ? "\<C-n>" : "\<NOP>"
"inoremap <expr>  <Up>       pumvisible() ? "\<C-p>" : "\<NOP>"
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>


" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Save and load sessions
map <Leader>s :mks! ~/dev/vim/
map <Leader>ss :so ~/dev/vim/

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" clear seach highlight
map <Leader>h :noh<CR>

" Vim on the iPad
if &term == "xterm-ipad"
  nnoremap <Tab> <Esc>
  vnoremap <Tab> <Esc>gV
  onoremap <Tab> <Esc>
  inoremap <Tab> <Esc>`^
  inoremap <Leader><Tab> <Tab>
endif

"""
" USER CONFIG
"""

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
