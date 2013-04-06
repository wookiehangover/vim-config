" Make vim more useful
set nocompatible

" Syntax highlighting options
set t_Co=256
set background=dark
syntax on
colorscheme badwolf

" Enabled later, after pathogen
filetype off

" Change mapleader
let mapleader=","

" Set local directories
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

" Set some junk
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set colorcolumn=80 " let us know where 80char lines should end
set cursorline " highlight the current line
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable
set foldlevel=4
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set list listchars=tab:\∴\ ,trail:·
set magic " Enable extended regexes.
set mouse=a " Enable moouse in all in all modes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shiftwidth=2 " The # of spaces for indenting.
set shortmess=atI " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set showtabline=1 " Always show tab bar.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set tabstop=2
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest,list:full
set winminheight=0 "Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file

" Powerline
set rtp+=~/.vim/bundle/powerline.vim/powerline/bindings/vim
set noshowmode
let g:Powerline_symbols = 'fancy'

" Use modeline overrides
set modeline
set modelines=10

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


"""
" PATHOGEN
"""
call pathogen#infect()
filetype plugin indent on


"""
" PLUGIN CONFIG
"""

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$', '\.dSYM$']
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeDirArrows=0
let NERDTreeMinimalUI=1

" Syntastic 
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let vimclojure#FuzzyIndent = 1

let g:tagbar_type_ruby = {
  \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
  \ ]
\ }

let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }

"""
" Plugin Graveyard
"""

" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" Command-T configuration
" let g:CommandTMaxFiles=1000
" let g:CommandTMatchWindowAtTop=1
" let g:CommandTMaxHeight=12
" let g:CommandTCancelMap=['<Esc>', '<C-c>']

" SuperTab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabCrMapping = 0
let g:SuperTabCompletionType = "context"
au BufEnter,BufRead,BufNewFile *.html,*.md,*.erb,*.jst,*.mustache,*.hbs,*.ejs let g:SuperTabMappingForward = '<s-tab>'
au BufLeave *.html,*.md,*.erb,*.jst,*.mustache,*.hbs,*.ejs let g:SuperTabMappingForward = '<tab>'

" Sparkup
"let g:sparkupNextMapping=''

" EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m'


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

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.txt call s:setupWrapping()

" Markdown
augroup mkd
  autocmd BufRead,BufNewFile *.md  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" Jade
au BufRead,BufNewFile *.jade set ft=jade syntax=jade

" JST
au BufRead,BufNewFile *.jst,*.hbs,*.mustache,*.ejs set syntax=jst

" Common Ruby files
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,Thorfile,config.ru,.autotest,.irbrc,*.treetop,*.tt,*.rabl set ft=ruby syntax=ruby

"""
" KEY MAPPINGS
"""

map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>

" remap escape to ctrl-c
imap <c-c> <esc>

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
nmap <C-up> [e
nmap <C-down> ]e

" Bubble multiple lines
vmap <C-up> [egv
vmap <C-down> ]egv

" clear seach highlight
map <Leader>h :noh<CR>

" Tag Bar
nmap <F8> :TagbarToggle<CR>

" Vim on the iPad
if &term == "xterm-ipad"
  nnoremap <Tab> <Esc>
  vnoremap <Tab> <Esc>gV
  onoremap <Tab> <Esc>
  inoremap <Tab> <Esc>`^
  inoremap <Leader><Tab> <Tab>
endif
