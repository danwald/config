"Created by Danny S. Crasto
set nocompatible              " be iMproved, required

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
Bundle 'nvie/vim-flake8'
Bundle 'gregsexton/gitv'
Bundle 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'gryf/pylint-vim.git'
Plugin 'ludovicchabant/vim-gutentags.git'
Plugin 'fatih/vim-go.git'
Plugin 'tpope/vim-obsession'
Plugin 'morhetz/gruvbox'
Plugin 'vim-syntastic/syntastic'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'raimon49/requirements.txt.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'dense-analysis/ale'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'deoplete-plugins/deoplete-jedi'
Plugin 'loremipsum'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'natebosch/vim-lsc'
call vundle#end() " required

" Plugin options
" flake
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
" taglist
let g:Tlist_File_Fold_Auto_Close=1
let g:Tlist_Auto_Update=1
let g:Tlist_Auto_Open=0
let g:Tlist_WinWidth=45
" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$']
" gutentags
"let g:gutentags_define_advanced_commands=1
"let g:gutentags_trace=1
let g:gutentags_ctags_executable='/usr/local/bin/ctags'
"[src, https://robertbasic.com/tags/gutentags/]
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']
" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = {'mode':'passive'}
nnoremap <F10> :SyntasticCheck<CR> :SyntasticToggleMode<CR> :w<CR>

syntax on
" shows matching brackets
set showmatch
"reload file on change
set autoread

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

colorscheme gruvbox
set background=dark

"using Source Code Pro
set anti enc=utf-8
set guifont=Source\ Code\ Pro\ 11

"search backwards from pwd-root for tag files
:set tags=./tags;

"create tags for virtualenv sources via http://robertodealmeida.posthaven.com/using-ctags-in-vim-with-a-python-virtualenv
"noremap ,T :!ctags -R -f $VIRTUAL_ENV/tags $VIRTUAL_ENV/lib/python*/<CR>
"et tags+=$VIRTUAL_ENV/tags

set wildmode=list:longest,full

"switch between source definition files map
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" uses a.vim plugin
let g:alternateNoDefaultAlternate=1

"highlight > 100 cols
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%91v.\+/

" ALE
let g:ale_fixers = {
 \ '*': ['remove_trailing_lines', 'trim_whitespace'],
 \ 'html': ['prettier'],
 \}
let g:ale_linters = {
 \ 'html': ['htmlhint'],
 \ 'json': ['jsonlint'],
 \ 'python': ['flake8'],
 \ 'xml': ['xmllint'],
 \ 'css': ['csslint'],
 \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

"flag unnecessary whitespace
highlight BadWhitespace ctermbg=red ctermfg=white guibg=#592929
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" sets tab space to 4 chars of spaces
filetype plugin indent on
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd Filetype html,javascript setlocal ts=2 sw=2 sts=0 noexpandtab

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

" clear trailing whitespace
autocmd FileType c,cpp,java,php,python,txt autocmd BufWritePre <buffer> %s/\s\+$//e
noremap <Leader>w :%s/\s\+$//e

" the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" markdown preview
let vim_markdown_preview_github=1

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>bl :ls<CR>
nnoremap <Leader>bb :bp<CR>
nnoremap <Leader>bf :bn<CR>
nnoremap <Leader>bg :e#<CR>
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

" OSX copy/paste
set clipboard=unnamed
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

"toggle spelling
nmap <Leader>S :setlocal spell! spelllang=en_us<CR>
autocmd FileType markdown,text,gitcommit setlocal spell

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"iSort
map <leader>i :Isort<cr>
command! -range=% Isort :<line1>,<line2>! isort -

"fzf
set rtp+=~/.fzf
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>t :Tags<CR>

"lsc
let g:lsc_server_commands = {'python': 'pyls'}
" Use all the defaults (recommended):
let g:lsc_auto_map = v:true

" Apply the defaults with a few overrides:
let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

" Setting a value to a blank string leaves that command unmapped:
let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

" ... or set only the commands you want mapped without defaults.
" Complete default mappings are:
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
	\}

" gitblame via https://redd.it/i50pce
nmap <silent><Leader>G :call setbufvar(winbufnr(popup_atcursor(split(system("git log -n 1 -L " . line(".") . ",+1:" . expand("%:p")), "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" count searches under cursor
map ,* *<C-O>:%s///gn<CR>

set statusline=%02n:%<%f%m\ %=[POS=%04l,%04v][%p%%][LEN=%L]%{FugitiveStatusline()}
set statusline+=%{gutentags#statusline()}
set laststatus=2
