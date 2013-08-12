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
" set bs=indent

" sets ruler on
"set ruler

" switches on syntax hightlighting
syntax on

" shows matching brackets
set showmatch

" highlighs last seach item
set hls
set incsearch


" multofile editiing . splits horizontal/vertical map mappings
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
"colorscheme pablo

set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%][LEN=%L]\ \ [%{GitBranch()}]
set laststatus=2

set cindent

"search backwards from pwd-root for tag files
:set tags=./tags;

set tags+=~/.vim/tags/py2.7.tags

"spelling en and doxygen comments
"set spelllang=en_us
"set spell 

set wildmode=list:longest,full

"switch between source definition files map
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" uses a.vim plugin
let g:alternateNoDefaultAlternate=1

"highlight > 90 cols
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.\+/

"taglist plugin
filetype on

"set t_kb=<BS>
"fixdel

set number

set foldmethod=indent
set foldlevelstart=3

"automatically source vimrc on write
au! BufWritePost .vimrc source %

"reload all and set filetypes
function! ReRead()
    bufdo e!
    doautoall Filetype
endfunction

execute pathogen#infect()
let g:flake8_ignore="E501,W293"
let g:flake8_max_line_length=90

" onmi-complete
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set completeopt+=menuone,longest,preview

" leader remap
let mapleader=","

" sudo file save
noremap <Leader>W :w !sudo tee % > /dev/null

" numbers plugin toggle
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#auto_close_doc = 0

" gitgutter
let g:gitgutter_eager = 0
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk
