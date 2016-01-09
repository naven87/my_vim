set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"Personal settings
execute pathogen#infect()
filetype plugin indent on
syntax enable  " enable syntax highlighting

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>

set tabstop=4      " number of visual spaces per TAB
set softtabstop=4  " number of visual spaces per TAB
set expandtab        " tabs are spaces

set cursorline       " highlight current line
"Set the status line options. Make it show more information.
set laststatus=2      " always have status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]i\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"
"Set Color Scheme and Font Options
colorscheme kolor
set guifont=Consolas:h12

"set line no, buffer, search, highlight, autoindent and more.
"set nu
set hidden            " hide buffers on switch
set ignorecase        " ignore case in searchs
set incsearch         " incremental search on
set smartcase         " smart case search on
set showmatch         " highlight matchin [{()}]
set autoindent        " copy indent from current line when starting new line
set ruler             " enable ruler (show line and column in footer)
set visualbell	      " turn on visual bell
set noerrorbells
set showcmd           " show las command in status line
set mouse=a           " enable mouse in GUI for all modes
set history=1000
set undolevels=1000

set viminfo+=n$VIM/_viminfo

" short cuts to edit with path to current location
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" adjust configuration for such hostile environment as Windows {{{
if has("win32") || has("win16")
  " lang C
  " set viminfo='20,\"512,nc:/tmp/_viminfo
  " set iskeyword=48-57,65-90,97-122,_,161,163,166,172,177,179,182,188,191,198,202,209,211,230,234,241,243,143,156,159,165,175,185
else
  " set shell=/bin/sh
endif
" }}}
" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction

" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :!start "c:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %:p<CR>'
