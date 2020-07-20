scriptencoding utf-8
"
"  _   _         __     ___
" | \ | | ___  __\ \   / (_)_ __ ___
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |\  |  __/ (_) \ V / | | | | | | |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
"

call plug#begin('$HOME/.local/share/nvim/plugged')
    " Basic Options
    set fileformat=unix

    " Abbreviaton
    abbr slef self
    abbr cosntants constants
    abbr unkown unknown
    abbr clas class
    abbr krags kwargs
    abbr __clas__ __class__

    " Show invisible characters
    set list
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    set showbreak=↪

    " Appearance
    set number relativenumber
    set scrolloff=3
    set noshowmode nowrap
    set ttyfast

    " Behaviour
    set splitright splitbelow
    set mouse=a " a for all
    set clipboard=unnamedplus
    set noswapfile
    set nofoldenable
    set path+=**
    set timeoutlen=400
    set nopaste

    " Configuration Group
    augroup ConfigGroup
        autocmd!
        " Save on focus lost
        autocmd FocusLost * silent! wa
        " Enable/disable cursorline when focus is lost/gained
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline
        " Set Filetypes
        autocmd BufRead,BufNewFile *.har set filetype=json
        autocmd BufRead,BufNewFile .zshrc,oh_my_zshrc set filetype=zsh
        autocmd FileType yaml,json,html set shiftwidth=2 tabstop=2 softtabstop=2
        autocmd Filetype gitcommit,md,tex,txt set spell
    augroup END

    " Searching
    set ignorecase " Case insensitive search
    set smartcase " case-sensitive if the expression contains a capital Letter
    set hlsearch " Highlight search results
    set incsearch " Set incremental search
    set nolazyredraw " Do not redraw while executing macros

    " Python configuration for tabs and spaces and all that
    set expandtab smartindent
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " Mappings
    let mapleader = ','
    nnoremap ; :
    nnoremap : ;

    " Save files and stuff
    nnoremap <leader>w :w<CR>
    nnoremap <leader>W :wqa!<CR>
    nnoremap <leader>e :wq!<CR>
    nnoremap <leader>q :q!<CR>
    nnoremap <leader>Q :qa!<CR>

    " Tabs, source and no highlight
    nnoremap <leader>R :source ~/.config/nvim/init.vim<CR>
    nnoremap <silent> <space> :noh<CR>

    " make ^, 0 and $ work like you expect
    nnoremap <silent> ^ g^
    nnoremap <silent> 0 g0
    nnoremap <silent> $ g$

    " Portview scroll faster
    nnoremap <silent> <C-e> 3<c-e>
    nnoremap <silent> <C-y> 3<c-y>

    " Switch to last buffer
    nnoremap <silent> <BS> <c-^>

    " Keep in vsual mode after indentation
    vmap <silent> < <gv
    vmap <silent> > >gv

    " More natural split navigation
    nnoremap <C-l> <C-W>l
    nnoremap <C-k> <C-W>k
    nnoremap <C-j> <C-W>j
    nnoremap <C-h> <C-W>h

    " Terminal splitting
    augroup terminalConfig
        au!
        autocmd TermOpen * setlocal nonumber norelativenumber
        autocmd TermOpen * startinsert
    augroup END

    nnoremap <silent> <c-w>tv <c-w>v :term<CR>
    nnoremap <silent> <c-w>ts <c-w>s :term<CR>
    " Move from withing the terminal split
    tnoremap <silent> <c-h> <c-\><c-n><c-w><c-h>
    tnoremap <silent> <c-j> <c-\><c-n><c-w><c-j>
    tnoremap <silent> <c-k> <c-\><c-n><c-w><c-k>
    tnoremap <silent> <c-l> <c-\><c-n><c-w><c-l>
    tnoremap <silent> <ESC> <c-\><c-n>

    " Options for vim-plug
    let g:plug_pwindow = 'vertical rightbelow new'
    let g:plug_timeout = 300

    " General plugins
    Plug 'arcticicestudio/nord-vim'
        let g:nord_cursor_line_number_background = 1
        let g:nord_uniform_diff_background = 1
        let g:nord_bold = 1 " Default
        let g:nord_italic = 1
        let g:nord_underline = 1

        augroup nord-theme-overrides
            autocmd!
            autocmd ColorScheme nord highlight Comment ctermfg=DarkGrey
        augroup END

    Plug 'ap/vim-css-color'

    " Lightline
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'
        let g:lightline = {
            \ 'colorscheme': 'nord',
            \ 'active': {
            \   'left': [
            \     ['mode', 'paste'],
            \     ['gitbranch'],
            \     ['readonly', 'filename', 'modified', 'readonly'],
            \   ],
            \   'right': [
            \     ['linter_warnings', 'linter_errors'],
            \     ['lineinfo', 'percent'],
            \     ['filetype', 'fileformat', 'filenameencoding'],
            \   ],
            \ },
            \ 'inactive': {
            \   'left': [
            \     [], [], ['filename'],
            \   ],
            \   'right': [
            \     [], [], ['filetype']
            \   ],
            \ },
            \ 'tabline': {
            \   'left': [ ['tabs'] ],
            \   'right': [],
            \ },
            \ 'tabs': {
            \   'active': ['filename', 'modified'],
            \   'inactive': ['filename', 'modified'],
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead',
            \   'readonly': 'LightlineReadonly',
            \   'filenameencoding': 'LightlineFileEncoding',
            \   'fileformat': 'LightlineFileFormat',
            \   'filename': 'LightlineFileName',
            \ },
            \ 'separator': {'left': "\ue0b0", 'right': "\ue0b2"},
            \ 'subseparator': {'left': '', 'right': ''},
        \ }

        let g:lightline.component_expand = {
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
        \ }

        let g:lightline.component_type = {
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \ }

        function! LightlineReadonly()
            " Check wether a file is readonly
            return &readonly && &filetype !=# 'help' ? 'RO' : ''
        endfunction

        function! LightlineFileEncoding()
            " Only return the file encoding if it's not utf-8
            return &fileencoding ==? 'utf-8' ? '' : &fileencoding
        endfunction

        function! LightlineFileFormat()
            " only show the file format if it's not 'unix'
            return &fileformat ==? 'unix' ? '' : &fileformat
        endfunction

        function! LightlineFileName() abort
            let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
            let modified = &modified ? ' +' : ''
            return fnamemodify(filename, ':~:.') . modified
        endfunction

    " Startify, alternative startup screen
    Plug 'mhinz/vim-startify'
        augroup startify
            autocmd User Startified setlocal cursorline
        augroup END

        " Don't change to directory when selecting a file
        let g:startify_files_number = 5
        let g:startify_change_to_dir = 0
        let g:startify_relative_path = 1
        let g:startify_use_env = 1

        function! s:gitModified()
            let files = systemlist('git ls-files -m 2>/dev/null')
            return map(files, "{'line': v:val, 'path': v:val}")
        endfunction

        " same as above, but show untracked files, honouring .gitignore
        function! s:gitUntracked()
            let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
            return map(files, "{'line': v:val, 'path': v:val}")
        endfunction

        " Custom startup list, only show MRU from current directory/project
        let g:startify_lists = [
            \  { 'type': 'dir', 'header': ['   Files '. getcwd()] },
            \  { 'type': function('s:gitModified'),  'header': ['   Modified']},
            \  { 'type': function('s:gitUntracked'), 'header': ['   Untracked']},
            \  { 'type': 'sessions',  'header': ['   Sessions'] },
            \  { 'type': 'commands',  'header': ['   Commands'] },
        \ ]

        let g:startify_commands = [
            \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
            \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
        \ ]
    " FZF - The most important plugin
    Plug 'junegunn/fzf.vim'
        let g:fzf_layout = { 'down': '~40%' }
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

        if has('nvim')
            let $FZF_DEFAULT_OPTS .= ' --inline-info'
        endif

        command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

        augroup fzfconfig
            autocmd! FileType fzf
            autocmd  Filetype fzf set noshowmode noruler nonu
        augroup END

        if isdirectory('.git')
            nnoremap <leader>f :GitFiles --cache --others --exclude-standard<CR>
        else
            nnoremap <leader>f :FZF<CR>
        endif

        nnoremap <leader>, :BLines<CR>

    Plug 'tpope/vim-fugitive', {'on': ['G', 'Gwrite', 'Gread', 'Gdiff', 'Gblame']}
    Plug 'mhinz/vim-signify'
    Plug 'rhysd/git-messenger.vim'
        let g:git_messenger_no_default_mappings = v:true
        let g:git_messenger_include_diff = 'current'
        let g:git_messenger_always_into_popup = v:true

    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    Plug 'christoomey/vim-sort-motion'

    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/rainbow_parentheses.vim'
        let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

        augroup rainbow
            autocmd!
            autocmd FileType * RainbowParentheses
        augroup END

    Plug 'junegunn/vim-slash'
        noremap <plug>(slash-after) zz
        if has('timers')
            " Blink 2 times with 50ms interval
            noremap <expr> <plug>(slash-after) 'zz'.slash#blink(3, 50)
        endif

    Plug 'dominikduda/vim_current_word'
        let g:vim_current_word#highlight_delay = 1000

    " Completion stuff
    Plug  'Shougo/deoplete.nvim'
        let g:deoplete#enable_at_startup = 1

        " Completion by Tab, navigate with C-n, C-p
        inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " Close preview window after completion
        augroup deopleteConfig
            autocmd!
            autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
        augroup END

        Plug 'deoplete-plugins/deoplete-jedi'
            let g:python3_host_prog = '/usr/bin/python3'

        Plug 'deoplete-plugins/deoplete-zsh'

    " Code jump
    Plug 'davidhalter/jedi-vim'
        let g:jedi#completions_enabled = 0
        let g:jedi#use_splits_not_buffers = 'winwidth'

    " Linting
    Plug 'dense-analysis/ale'
        let g:airline#extensions#ale#enabled = 1

        let g:ale_lint_on_text_changed = 'never'
        let g:ale_lint_on_insert_leave = 0

        let g:ale_linters_explicit = 1
        let g:ale_linters = {
            \ 'python': ['flake8', 'vulture', 'mypy'],
            \ 'rust': ['rls'],
            \ 'sh': ['shellcheck'],
            \ 'tex': ['lacheck'],
            \ 'vim': ['vint']
            \ }

        let g:ale_set_loclist = 1
        let g:ale_fix_on_save = 1

        let g:ale_fixers = {
            \ '*': ['trim_whitespace', 'remove_trailing_lines'],
            \ 'css': ['prettier'],
            \ 'html': ['prettier'],
            \ 'javascript': ['prettier'],
            \ 'json': ['jq'],
            \ 'markdown': ['prettier'],
            \ 'python': ['isort', 'black'],
            \ 'rust': ['rustfmt']
            \ }

        let g:ale_python_black_options = '--config $DOTFILES/python/black-config.toml'
        let g:ale_python_flake8_options = '--config $DOTFILES/python/flake8'
        let g:ale_python_isort_options = ''
        let g:ale_python_mypy_options = ''
        let g:ale_python_vulture_options = '--min-confidence 100'

        nnoremap <silent> ]l :ALENextWrap<CR>
        nnoremap <silent> [l :ALEPreviousWrap<CR>

    " Docstring autoformatter
    function! <SID>format_docstrings()
        let l = line('.')
        let c = col('.')
        %!docformatter -c --wrap-summaries $PYTHON_LINE_LENGTH --wrap-descriptions $PYTHON_LINE_LENGTH -
        call cursor(l, c)
    endfun

    nnoremap <leader>DS :call <SID>format_docstrings()<CR>

    " Language specific plugins
    Plug 'plasticboy/vim-markdown', { 'for': ['md', 'rst']}
        let g:vim_markdown_folding_disabled = 1
        let g:vim_markdown_conceal = 0

    Plug 'lervag/vimtex', {'for': 'tex'}
    Plug 'cespare/vim-toml', { 'for': 'toml' }
    Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['html'] }
    Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfie'}

    " Only load these plugins when inside tmux"
    Plug 'christoomey/vim-tmux-navigator'
        let g:tmux_navigator_save_on_switch = 1
        let g:tmux_navigator_disable_when_zoomed = 1
        let g:tmux_navigator_no_mappings = 1

        nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'wellle/tmux-complete.vim'

call plug#end() " Finished Initialising Plugins

" Set the colorscheme
set background=dark
colorscheme nord
