"
"  _   _         __     ___
" | \ | | ___  __\ \   / (_)_ __ ___
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |\  |  __/ (_) \ V / | | | | | | |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
"
" Specify directory for plugins: VERY IMPORTANT TO USE SINGLE QUOTES
call plug#begin('$VIMPLUGINS')
    set nocompatible
    set fileformat=unix
    set t_Co=256

    " Appearance
    set nu relativenumber
    set scrolloff=2
    set noshowmode
    set nowrap

    " Behaviour
    set splitright
    set splitbelow
    set mouse=a " a for all
    set clipboard=unnamedplus
    set noswapfile
    set nofoldenable
    set ignorecase smartcase
    set path+=**
    set timeoutlen=400

    " Abbreviaton
    abbr slef self
    abbr cosntants constants
    abbr unkown unknown

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
        " Format JSON files with jq
        autocmd BufWrite *.json execute ':%!jq'
    augroup END

    " Python configuration for tabs and spaces and all that
    set expandtab smartindent
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " Mappings
    let mapleader = ','
    nmap <leader>w :w<CR>
    nmap <leader>q :q!<CR>
    nmap <leader>e :wq!<CR>
    nnoremap <leader>r :source $VIMRC<CR>
    nnoremap <silent> <space> :noh<CR>
    nnoremap <silent> ^ g^
    nnoremap <silent> 0 g0
    nnoremap <silent> $ g$
    nnoremap <silent> <C-e> 3<c-e>
    nnoremap <silent> <C-y> 3<c-y>
    nnoremap <silent> <BS> <c-^>
    " Keep in vsual mode after indentation
    vmap <silent> < <gv
    vmap <silent> > >gv

    " Terminal splitting
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * startinsert

    nnoremap <silent> <c-w>tv <c-w>v :term<CR>
    nnoremap <silent> <c-w>ts <c-w>s :term<CR>
    " Move from withing the terminal split
    tnoremap <silent> <c-h> <c-\><c-n><c-w><c-h>
    tnoremap <silent> <c-j> <c-\><c-n><c-w><c-j>
    tnoremap <silent> <c-k> <c-\><c-n><c-w><c-k>
    tnoremap <silent> <c-l> <c-\><c-n><c-w><c-l>

    " More natural split navigation
    nnoremap <C-l> <C-W>l
    nnoremap <C-k> <C-W>k
    nnoremap <C-j> <C-W>j
    nnoremap <C-h> <C-W>h

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

    Plug 'vim-airline/vim-airline'
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 0
        let g:airline_section_x = '%{PencilMode()}'

    if has('nvim')
        Plug 'mhinz/vim-startify'
            autocmd User Startified setlocal cursorline

            " Don't change to directory when selecting a file
            let g:startify_files_number = 5
            let g:startify_change_to_dir = 0
            let g:startify_relative_path = 1
            let g:startify_use_env = 1

            function! s:list_commits()
                let git = 'git -C ' . getcwd()
                let commits = systemlist(git . ' log --oneline | head -n5')
                let git = 'G' . git[1:]
                return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
            endfunction

            " Custom startup list, only show MRU from current directory/project
            let g:startify_lists = [
                \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
                \  { 'type': function('s:list_commits'), 'header': [ 'Recent Commits' ] },
                \  { 'type': 'sessions',  'header': [ 'Sessions' ] },
                \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ] },
                \  { 'type': 'commands',  'header': [ 'Commands' ] },
            \ ]

            let g:startify_commands = [
                \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
                \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
                \   { 'uc': [ 'Upgrade CoC Extensions', ':CocUpdateSync' ] },
            \ ]
    endif

    Plug 'junegunn/rainbow_parentheses.vim'
        let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
        augroup rainbow
            autocmd!
            autocmd FileType * RainbowParentheses
        augroup END

    Plug '/usr/bin/fzf'
    Plug 'junegunn/fzf.vim'
        let g:fzf_layout = { 'down': '~25%' }
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

        command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

        nnoremap <leader>g :GGrep<CR>
        nnoremap <leader>b :Buffers<CR>

    Plug 'scrooloose/nerdtree'
        " Close vim if NERDTree is the only window
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        nnoremap <silent> \\ :NERDTreeToggle<CR>
        let NERDTreeQuitOnOpen = 1
        let NERDTreeAutoDeleteBuffer = 1
        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows = 1
        let NERDTreeShowHidden = 1
        let NERDTreeIgnore = ['\.pyc$', '__pycache__/', '.git/', '\.swp$']

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

    Plug 'scrooloose/nerdcommenter'
        let g:NERDSpaceDelims = 1
        let g:NERDCompactSexyComs = 1
        let g:NERDDefaultAlign = 'left'

    " Git plugins: Only load when we are in a git repo.
    if isdirectory(".git")
        Plug 'tpope/vim-fugitive'
            " Add JIRA issue to commit message
            nnoremap \gg :normal 5gg5wy$ggp<CR>a
            nnoremap \gb :normal 5gg3wy$ggp<CR>a

        Plug 'sodapopcan/vim-twiggy'
            nnoremap <leader>t :Twiggy<CR>

        Plug 'mhinz/vim-signify'
        Plug 'Xuyuanp/nerdtree-git-plugin'

        nnoremap <leader>f :GitFiles --cache --others --exclude-standard<CR>
        nnoremap <leader>c :BCommits<CR>
    else
        nnoremap <leader>f :FZF<CR>
    endif

    Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_min_num_of_chars_for_completion = 2
        let g:ycm_collect_identifiers_from_comments_and_strings = 1
        let g:ycm_seed_identifiers_with_syntax = 1

        nmap <silent> <leader>d :YcmCompleter GoTo<CR>
        nmap <silent> <leader>x :YcmCompleter GoToReferences<CR>
        nnoremap <silent> K :YcmCompleter GetDoc<CR>

    Plug 'dense-analysis/ale'
        let g:ale_lint_on_text_changed = 'never'
        let g:ale_lint_on_insert_leave = 0
        let g:ale_set_loclist = 1

        nmap <silent> ]l :ALENextWrap<CR>
        nmap <silent> [l :ALEPreviousWrap<CR>

        let g:airline#extensions#ale#enabled = 1

        let g:ale_linters_explicit = 1
        let g:ale_linters = {'python': ['flake8']}

        let g:ale_fix_on_save = 1
        let g:ale_fixers = {
            \ '*': ['trim_whitespace', 'remove_trailing_lines'],
            \ 'python': ['isort', 'black'],
        \ }

        " Docstring autoformatter
        function! <SID>format_docstrings()
            let l = line(".")
            let c = col(".")
            %!docformatter -c --wrap-summaries $PYTHON_LINE_LENGTH --wrap-descriptions $PYTHON_LINE_LENGTH -
            call cursor(l, c)
        endfun

        nnoremap \ds :call <SID>format_docstrings()<CR>

    Plug 'Yggdroot/indentLine'
        let g:indentLine_char_list = ['|', '¦', '┆', '┊']

    Plug 'ekalinin/Dockerfile.vim'

    " Other plugins
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'junegunn/vim-slash'
        noremap <plug>(slash-after) zz
        if has('timers')
        " Blink 2 times with 50ms interval
        noremap <expr> <plug>(slash-after) slash#blink(2, 50)
        endif

    " Writer's room:
    Plug 'junegunn/goyo.vim' " 0 Distractions
        let g:goyo_width = $TEXT_LINE_LENGTH
        " TODO: Configuations
    Plug 'reedes/vim-pencil' " Turn VIM into a good writing editor.
        " TODO: Configure both GOYO and Pencil to trigger automatically for MD, RST, TXT, etc... files.
    Plug 'lervag/vimtex' " Latex in Vim
        " TODO: Look at the mappings and configs for this
    Plug 'gabrielelana/vim-markdown'
        " TODO: Plug 'plasticboy/vim-markdown' " Maybe it's an alternative to the above plugin
        let g:pencil#autoformat = 1
        let g:pencil#textwidth = $TEXT_LINE_LENGTH

    if (exists("$TMUX")) " Only load these plugins when inside tmux
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
    endif

call plug#end() " Finished Initialising Plugins

" Set the colorscheme
set background=dark
colorscheme nord
