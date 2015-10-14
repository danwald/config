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
Bundle 'vim-scripts/AutoTag.git'
Bundle 'nvie/vim-flake8'
Bundle 'airblade/vim-gitgutter'
Bundle 'myusuf3/numbers.vim'
Bundle 'ervandew/supertab'
Bundle 'fatih/vim-go'
Bundle 'gregsexton/gitv'
Bundle 'scrooloose/nerdtree'

call vundle#end()            " required

" Plugin options 
" flake
let g:flake8_show_in_file=1
let g:flake8_error_marker='EE'
let g:flake8_warning_marker='WW'
let g:flake8_pyflake_marker=''
let g:flake8_complexity_marker=''
let g:flake8_naming_marker=''
" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
autocmd FileType python map <buffer> <Leader>F :call Flake8()<CR>
" onmi-complete
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" numbers plugin toggle
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'taglist', 'minibufexpl', 'nerdtree']
" gitgutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
let g:gitgutter_sign_column_always = 1
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

" taglist
let g:Tlist_File_Fold_Auto_Close=1
let g:Tlist_Auto_Update=1
let g:Tlist_Auto_Open=0
let g:Tlist_WinWidth=45

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set completeopt+=menuone,longest,preview

" sets tab space to 4 chars of spaces
set sts=4
set ts=4
set sw=4
set et

"sets smartindent on
set smartindent
set autoindent

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
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"atch OverLength /\%91v.\+/

"taglist plugin
filetype plugin indent on

"set t_kb=<BS>
"fixdel

"set foldmethod=indent
"set foldlevelstart=10
set nofoldenable

"automatically source vimrc on write
au! BufWritePost .vimrc source %

"reload all and set filetypes
function! ReRead()
    bufdo e!
    doautoall Filetype
endfunction

" leader remap
let mapleader=","

" sudo file save
noremap <Leader>W :w !sudo tee % > /dev/null

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
nnoremap <Leader>t :tabp<CR>


vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

set statusline=%02n:%<%f%m\ %=[POS=%04l,%04v][%p%%][LEN=%L]
set laststatus=2
