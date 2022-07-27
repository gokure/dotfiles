" Required https://github.com/amix/vimrc.git
" My pathogen
try
  call pathogen#infect('~/.vim/bundle/{}')
catch
endtry

syntax enable

set number
set numberwidth=5
set ff=unix
set backspace=2
set ruler
set showcmd
set fileencodings=ucs-bom,utf-8,gb18030,gbk,cp936,big5,euc-jp,euc-kr,latin1
set history=1000
set nobackup
set noswapfile

" Softtabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Tabstops and EOLs
set list listchars=tab:»\ ,eol:¬

set textwidth=80
set colorcolumn=+1

set matchpairs+=<:>
set hlsearch

" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"

map <F1> :bp<CR>
map <F2> :bn<CR>
map <F3> :buffers<CR>:buffer<Space>
map <F4> :q<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :TagbarToggle<CR>
map <F7> :split<CR>
map <F8> :vert split<CR>
map <leader>r :NERDTreeFind<CR>

" Tabs
map <C-S-Ins> :tabnew<CR>
imap <C-S-Ins> <ESC>:tabnew<CR>i

" clear search partten
command C let @/=""

" Mac settings
" Disable MacVim in fullscreen mode
if has("gui_macvim")
  autocmd! GUIEnter *
endif

" Windows settings
if has("win32")
  " Menu mess
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  " Console mess
  "language messages zh_CN.UTF-8
endif

" hortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=48 columns=160

  " Themes
  try
    colorscheme solarized
  catch
  endtry
endif

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" add ctrlp.vim setting
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|.DS_Store\|.pyc$\|vendor'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=25
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_clear_cache_on_exit=0

" PyMatcher for CtrlP
" https://github.com/FelikZ/ctrlp-py-matcher
if has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
