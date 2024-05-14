"Created by Danny S. Crasto
set nocompatible              " be iMproved, required

" set the runtime path to include plug and initialize
call plug#begin()

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Shougo/deoplete.nvim'
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
Plug 'dense-analysis/ale'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'fatih/vim-go'
Plug 'feline-nvim/feline.nvim'
Plug 'gregsexton/gitv'
Plug 'gryf/pylint-vim'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'morhetz/gruvbox'
Plug 'mtth/scratch.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvie/vim-flake8'
Plug 'raimon49/requirements.txt.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/SimpylFold'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-syntastic/syntastic'
Plug 'wakatime/vim-wakatime'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'jackMort/ChatGPT.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rhysd/git-messenger.vim'
Plug 'shellRaining/hlchunk.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pechorin/any-jump.vim'

call plug#end() " required

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

"using Monoid https://larsenwork.com/monoid/
let guifont="Monoid Retina 9"

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

" Scratch
let g:scratch_persistence_file = '~/.scratch.vim'
let g:scratch_autohide = 1

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
let vim_markdown_preview_browser='Google Chrome'

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
nmap <C-c> :%y+<CR>

"toggle spelling
nmap <Leader>S :setlocal spell! spelllang=en_us<CR>
autocmd FileType markdown,text,gitcommit setlocal spell

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"fzf
set rtp+=$HOMEBREW_PREFIX/opt/fzf
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>t :Tags<CR>


" Use deoplete.
let g:deoplete#enable_at_startup = 1

" count searches under cursor
map ,* *<C-O>:%s///gn<CR>
autocmd FileType yaml setlocal ai et cuc sw=2 ts=2

let g:python3_host_prog = "$HOME/.asdf/shims/python"
lua << EOF
vim.g.editorconfig = false
--vim.opt.termguicolors = true
--require('feline').setup()
--require('feline').winbar.setup()

require("mason").setup()
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.bashls.setup {}
lspconfig.cssls.setup {}
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup {}
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lspconfig.yamlls.setup {}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt"},
  log_file_path = nil, -- absolute path to Tabnine log file
})

require("chatgpt").setup()
require("hlchunk").setup({})
EOF

" chatgpt
nnoremap <Leader>C :ChatGPT<CR>

set mouse=
set statusline=%02n:%<%f%m\ %=[POS=%04l,%04v][%p%%][LEN=%L]%{FugitiveStatusline()}
set statusline+=%{gutentags#statusline()}
set laststatus=2
