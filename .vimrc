"Created by Danny S. Crasto


" sets tab space to 4 chars of spaces
set sts=4
set ts=4
set sw=4
set et

"sets smartindent on
set smartindent
set autoindent

"sets expandtab

" sets bs equal to indent
set bs=indent

" sets ruler on
"set ruler

" switches on syntax hightlighting
syntax on

" shows matching brackets
set showmatch

" highlighs last seach item
set hls
set incsearch


" multofile editiing . slits horizontal/vertical map mappings
set wmw=0
set wmh=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l


" doxguen syntax
:let g:load_doxygen_syntax=1

" 256Colors terminal
set t_Co=256


colorscheme xoria256
"colorscheme desert
"olorscheme pablo

set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2

set cindent

"search backwards from pwd-root for tag files
:set tags=./tags;

:au!    BufRead,BufNewFile *.conf,*.bb,*.bbclass,*.inc,*.target  set filetype=lxkbb

"spelling en and doxygen comments
"set spelllang=en_us
"set spell 

set wildmode=list:longest,full

"switch between source definition files map
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" uses a.vim plugin
let g:alternateNoDefaultAlternate=1

"highlight > 80 cols
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"taglist plugin
filetype on

set t_kb=<BS>
fixdel


" map control-backspace to delete the previous word
:imap <C-BS> <C-W>

"xmledit plgin
filetype plugin on
