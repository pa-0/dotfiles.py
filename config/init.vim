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

    " More natural split navigation
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

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
    " Set leader key
    let mapleader = ','
    " Highlight search result and remap :nohs
    nnoremap <silent> <leader><space> :noh<CR>
    " Python mappings
    nnoremap <silent> <leader>j :%!python -m json.tool<CR>
    nnoremap <leader>i :!isort -y % <CR> | redraw | update
    " Remove trailing spaces
    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
    " moving up and down work as you would expect
    nnoremap <silent> ^ g^
    nnoremap <silent> 0 g0
    nnoremap <silent> $ g$
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    " Make viewport scroll faster
    nnoremap <silent> <C-e> 3<c-e>
    nnoremap <silent> <C-y> 3<c-y>
    " Less keystrokes
    nnoremap ; :
    nnoremap : ;
    " Keep visual selection when indenting/unindenting
    vmap < <gv
    vmap > >gv

    " Reload vimrc
    nnoremap <leader>r :source $VIMRC<CR>

    Plug 'arcticicestudio/nord-vim'

    Plug 'vim-airline/vim-airline'
        let g:airline_powerline_fonts = 1

    if has('nvim') 
        Plug 'mhinz/vim-startify'
            autocmd User Startified setlocal cursorline
            nmap <leader>st :Startify<cr>

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

    Plug 'luochen1990/rainbow'
        let g:rainbow_active = 1

    Plug '/usr/bin/fzf'
    Plug 'junegunn/fzf.vim'
        let g:fzf_layout = { 'down': '~25%' }

        "FZF mappings
        nnoremap <leader>b :Buffers<CR>
        nnoremap <leader>p :BLines<CR>

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

    " Git plugins: Only load when we are in a git repo.
    if isdirectory(".git")
        Plug 'tpope/vim-fugitive'
            " Add JIRA issue to commit message
            nnoremap <leader>g  :normal 5gg5wy$ggp<CR>a
            nnoremap <leader>gb :normal 5gg3wy$ggp<CR>a

        Plug 'airblade/vim-gitgutter'
        Plug 'Xuyuanp/nerdtree-git-plugin'

        nnoremap <leader>f :GitFiles --cache --others --exclude-standard<CR>
        nnoremap <leader>l :Commits<CR>
        nnoremap <leader>c :BCommits<CR>
    else
        nnoremap <leader>f :Files<CR>
    endif

    Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_autoclose_preview_window_after_completion = 1
        nnoremap <silent> <leader>d :YcmCompleter GoTo<CR>
        nnoremap <silent> <leader>s :YcmCompleter GoToReferences<CR>

    Plug 'vim-syntastic/syntastic'
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_check_on_w = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_auto_jump = 0
        let g:syntastic_python_checkers = ['flake8']

        nnoremap <silent> <F8> <ESC>:call SyntasticToggle()<CR>

        let g:syntastic_is_open = 0
        function! SyntasticToggle()
            if g:syntastic_is_open == 1
                lclose
                let g:syntastic_is_open = 0
            else
                Errors
                let g:syntastic_is_open = 1
            endif
        endfunction

    Plug 'ambv/black'
        let g:black_fast = 0
        let g:black_linelength = 120
        let g:black_skip_string_normalization = 0
        let g:black_virtualenv = '~/.virtualenv/black_virtualenv'
        autocmd BufWritePre *.py execute ':Black'

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
colorscheme nord
