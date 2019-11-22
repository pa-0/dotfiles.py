"NEOVIM config file
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

    " Python configuration for tabs and spaces and all that
    set expandtab smartindent
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    autocmd BufRead,BufNewFile *.har set filetype=json
    autocmd BufRead,BufNewFile zshrc set filetype=zsh
    autocmd FileType yaml set shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType json set shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html set shiftwidth=2 tabstop=2 softtabstop=2

    " Enable/disable cursorline when focus is lost/gained
    augroup BgHighlight
        autocmd!
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline
    augroup END

    " Mappings
    let mapleader = ','
    nnoremap <leader>r :source $VIMRC<CR>
    nnoremap <silent> <leader><space> :noh<CR>
    nnoremap <silent> <leader>j :%!python -m json.tool<CR>
    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
    nnoremap <silent> ^ g^
    nnoremap <silent> 0 g0
    nnoremap <silent> $ g$
    nnoremap <silent> <C-e> 3<c-e>
    nnoremap <silent> <C-y> 3<c-y>
    nnoremap <leader>w :w<CR>
    nnoremap <leader>e :wq<CR>
    nnoremap <leader>a :wqa<CR>
    nnoremap <leader>q :q!<CR>
    nnoremap <leader>s :qa!<CR>

    " Keep in vsual mode after indentation
    vmap < <gv
    vmap > >gv

    " More natural split navigation
    " I do not know how to handle semicolon
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-H> <C-W><C-H>

    Plug 'arcticicestudio/nord-vim'

    Plug 'vim-airline/vim-airline'
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

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
            \ ]

            let g:startify_bookmarks = [
                \ { 'a': '~/dotfiles/oh_my_zshrc' },
                \ { 's': '~/dotfiles/config/init.vim' },
                \ { 'd': '~/dotfiles/i3/i3_config' },
                \ { 'f': '~/dotfiles/gitconfig' }
            \ ]
    endif

    Plug 'junegunn/rainbow_parentheses.vim'
        let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

    Plug '/usr/bin/fzf'
    Plug 'junegunn/fzf.vim'
        let g:fzf_layout = { 'down': '~25%' }
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

        nnoremap <leader>b :Buffers<CR>
        if (exists("$RP_COMMON"))
            nnoremap <leader>rc :Files $RP_COMMON/crwcommon/crwcommon<CR>
            nnoremap <leader>rt :Files $RP_COMMON/crwtestutils/crwtestutils<CR>
        endif

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
            nnoremap <leader>g  :normal 5gg5wy$ggp<CR>a
            nnoremap <leader>gb :normal 5gg3wy$ggp<CR>a

        Plug 'airblade/vim-gitgutter'
        Plug 'Xuyuanp/nerdtree-git-plugin'

        nnoremap <leader>f :GitFiles --cache --others --exclude-standard<CR>
        nnoremap <leader>c :BCommits<CR>
    endif

    Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_server_python_interpreter = '/usr/bin/python3'
        nnoremap <silent> <leader>d :YcmCompleter GoTo<CR>
        nnoremap <silent> <leader>x :YcmCompleter GoToReferences<CR>

    Plug 'dense-analysis/ale'
        let g:ale_lint_on_text_changed = 'never'
        let g:ale_lint_on_insert_leave = 0

        let g:airline#extensions#ale#enabled = 1

        let g:ale_linters_explicit = 1
        let g:ale_linters = {'python': ['flake8']}

        let g:ale_fix_on_save = 1
        let g:ale_fixers = {
            \ '*': ['trim_whitespace', 'remove_trailing_lines'],
            \ 'python': ['isort']
            \ }

    Plug 'ambv/black'
        let g:black_fast = 0
        let g:black_linelength = 120
        let g:black_skip_string_normalization = 0
        let g:black_virtualenv = '~/.local/pipx/venvs/black'
        autocmd BufWritePre *.py execute ':Black'

    " Docstring autoformatter
    function! <SID>format_docstrings()
        let l = line(".")
        let c = col(".")
        %!docformatter -c --wrap-summaries 120 --wrap-descriptions 120 -
        call cursor(l, c)
    endfun
    autocmd BufWrite *.py :call <SID>format_docstrings()

    Plug 'Yggdroot/indentLine'
        let g:indentLine_char_list = ['|', '¦', '┆', '┊']

    Plug 'ekalinin/Dockerfile.vim'

    " Other plugins
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'junegunn/vim-slash'
        noremap <plug>(slash-after) zz

    Plug 'lervag/vimtex' " https://github.com/lervag/vimtex

    if (exists("$TMUX")) " Only load these plugins when inside tmux
        " Tmux integration with vim
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'tmux-plugins/vim-tmux-focus-events'
        Plug 'wellle/tmux-complete.vim'
    endif

call plug#end() " Finished Initialising Plugins

" Set the colorscheme
set background=dark
colorscheme nord
