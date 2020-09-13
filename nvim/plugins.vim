call plug#begin('$HOME/.local/share/nvim/plugged')

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
            \     ['virtualenv', 'filetype', 'fileformat', 'filenameencoding'],
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
            \   'virtualenv': 'poetv#statusline'
            \ }
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
            autocmd User Startified setlocal nocursorline
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

    Plug 'mhinz/vim-signify'
    Plug 'rhysd/git-messenger.vim'
        let g:git_messenger_no_default_mappings = v:true
        let g:git_messenger_include_diff = 'current'
        let g:git_messenger_always_into_popup = v:true

    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive', {'on': ['G', 'Gblame', 'Gdiff', 'Ggrep', 'Gread', 'Gwrite']}
        map <leader>* :Ggrep --untracked <cword> <CR><CR>

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

    Plug 'junegunn/vim-peekaboo'
        let g:peekaboo_window = 'vert bo 60new'

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

        " Completion selection candidates using TAB/S-TAB
        inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
        inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

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

        let g:ale_python_black_options = '-l $PYTHON_LINE_LENGTH'
        let g:ale_python_flake8_options = '--max-line-length $PYTHON_LINE_LENGTH'
        let g:ale_python_isort_options = ''
        let g:ale_python_mypy_options = '--config-file $DOTFILES/python/mypy.ini'
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

    " Python specific plugins
    Plug 'petobens/poet-v'
        let g:poetv_executables = ['poetry']
        let g:poetv_statusline_symbol = '<'
        let g:poetv_set_environment = 1
        let g:poetv_auto_activate = 1

    " Language specific plugins
    Plug 'plasticboy/vim-markdown', { 'for': ['md', 'rst']}
        let g:vim_markdown_folding_disabled = 1
        let g:vim_markdown_conceal = 0

    Plug 'lervag/vimtex', {'for': ['tex']}
    Plug 'cespare/vim-toml', { 'for': ['toml']}
    Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['html']}
    Plug 'ekalinin/Dockerfile.vim', {'for': ['Dockerfile']}

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
