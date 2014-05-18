" Start without the toolbar
set guioptions-=T
set guioptions-=L
set guioptions-=r

set transparency=5

color atom
" color monokaidark
" color tomorrow_night
" color darkburn
" color badwolf
" color solarized
" color inkpot

" Some *special* options if we're in macvim
if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " CtrlP
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>

  " Command-/ to toggle comments
  map <D-/> <Plug>Commentary<CR>

  let g:gist_clip_command = 'pbcopy'
  let g:gist_open_browser_after_post = 1
  let g:gist_detect_filetype = 1

  " Set font preference
  set guifont=Source\ Code\ Pro\ for\ Powerline:h13
endif


" Project Tree
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call s:UpdateNERDTree()

" Some NerdTree Halper functions from Janus

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . a:directory
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
