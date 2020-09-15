scriptencoding utf-8
"
"  _   _         __     ___
" | \ | | ___  __\ \   / (_)_ __ ___
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |\  |  __/ (_) \ V / | | | | | | |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
"
" Basic Options
set fileformat=unix

" Abbreviaton
abbr slef self
abbr cosntants constants
abbr unkown unknown
abbr clas class
abbr krags kwargs
abbr __clas__ __class__

" Misc
set clipboard+=unnamedplus
set cursorline
set mouse=a
set nofoldenable
set nopaste
set noshowmode
set noswapfile
set nowrap
set path+=**
set scrolloff=3
set signcolumn=yes
set splitright splitbelow
set timeoutlen=400
set ttyfast
set updatetime=100

" Tab magic
set expandtab
set shiftround
set smartindent
set smarttab
set softtabstop
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Searching
set ignorecase " Case insensitive search
set smartcase " case-sensitive if the expression contains a capital Letter
set hlsearch " Highlight search results
set incsearch " Set incremental search
set nolazyredraw " Do not redraw while executing macros

" Show invisible characters
set list listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮ showbreak=↪

" Configuration Group
augroup ConfigGroup
    autocmd!
    " Save on focus lost
    autocmd FocusLost * silent! wa!
    " Set Filetypes
    autocmd BufRead,BufNewFile *.har set filetype=json
    autocmd FileType yaml,javascript,json,html setlocal sw=2 ts=2 sts=2
    autocmd Filetype gitcommit,md,tex,txt setlocal spell
    autocmd Filetype python setlocal colorcolumn=$PYTHON_LINE_LENGTH
augroup END

source $DOTFILES/nvim/mappings.vim
source $DOTFILES/nvim/plugins.vim
