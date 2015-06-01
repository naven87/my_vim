set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

execute pathogen#infect()
syntax on
filetype plugin indent on

nmap <leader>l :set list!<CR>
set listchars=tab:?\ ,eol:¬

" Custom options
" indentation
set autoindent
set smartindent
"set t_Co=256
" color scheme that works well with dark or light backgrounds
"colorscheme delek
"colorscheme relaxedgreen
"colorscheme xoria256
" peaksea
" if ! has("gui_running")
"     set t_Co=256
" endif
" " set background=light gives a different style, feel free to choose between them.
" set background=dark
" colors peaksea
" K&R style
"set cinoptions=:0,p0,t0
" Documentation/CodingStyle
set cinoptions=:0,l1,t0,g0,(0
" comment style
set formatoptions=tcqlron
" configure split behavior
"set splitright
" highlight searches
set hlsearch
hi Search cterm=reverse ctermbg=none
hi SignColumn ctermbg=254
"hi SignColumn ctermbg=235



set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

