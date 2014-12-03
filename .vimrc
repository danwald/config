"Created by Danny S. Crasto
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'wakatime/vim-wakatime'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'

call vundle#end()            " required

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

"using Source Code Pro
set anti enc=utf-8
set guifont=Source\ Code\ Pro\ 11

set cindent

"search backwards from pwd-root for tag files
:set tags=./tags;

set tags+=~/.vim/tags/py2.7.tags;
set tags+=~/.vim/tags/dubizzle.tags;
set tags+=~/.vim/tags/cpp.tags

"spelling en and doxygen comments
"set spelllang=en_us
"set spell 

set wildmode=list:longest,full

"switch between source definition files map
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" uses a.vim plugin
let g:alternateNoDefaultAlternate=1

"highlight > 100 cols
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.\+/

"taglist plugin
filetype plugin indent on

"set t_kb=<BS>
"fixdel

"set foldmethod=indent
"set foldlevelstart=10

"automatically source vimrc on write
au! BufWritePost .vimrc source %

"reload all and set filetypes
function! ReRead()
    bufdo e!
    doautoall Filetype
endfunction

execute pathogen#infect()
let g:flake8_ignore="E501,W293"
let g:flake8_max_line_length=100
autocmd FileType python map <buffer> <leader><bar>:call Flake8()<CR>
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
" let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#popup_on_dot = 0
"let g:jedi#auto_close_doc = 0

" gitgutter
let g:gitgutter_eager = 0
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

" taglist
let g:Tlist_File_Fold_Auto_Close=1
let g:Tlist_Auto_Update=1
let g:Tlist_Auto_Open=1
let g:Tlist_WinWidth=36

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
set statusline=%02n:%<%f\ %=[POS=%04l,%04v][%p%%][LEN=%L]%{fugitive#statusline()}
set laststatus=2
