scriptencoding utf-8

" Options for vim-plug
let g:plug_pwindow = 'vertical rightbelow new'
let g:plug_timeout = 300

call plug#begin('$HOME/.local/share/nvim/plugged')

    " General plugins
    Plug 'arcticicestudio/nord-vim'

    " Lightline
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'
    Plug 'niklaas/lightline-gitdiff'

    " Startify, alternative startup screen
    Plug 'mhinz/vim-startify'
    Plug 'dstein64/nvim-scrollview'
    Plug 'farmergreg/vim-lastplace'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " FZF - The most important plugin
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'

    Plug 'mhinz/vim-signify'
    Plug 'rhysd/git-messenger.vim'

    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    Plug 'chaoren/vim-wordmotion'

    Plug 'christoomey/vim-sort-motion'

    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/rainbow_parentheses.vim'

    Plug 'junegunn/vim-peekaboo'

    Plug 'junegunn/vim-slash'

    Plug 'dominikduda/vim_current_word'

    " Completion stuff
    Plug  'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }

    Plug 'davidhalter/jedi-vim', { 'for': 'python' }

    Plug 'deoplete-plugins/deoplete-zsh', { 'for': 'sh' }
    Plug 'deoplete-plugins/deoplete-docker', { 'for': 'Dockerfile' }
    Plug 'deoplete-plugins/deoplete-dictionary'
    Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rs' }

    " Linting
    Plug 'dense-analysis/ale'

    " Testing framework in vim
    Plug 'vim-test/vim-test'

    " Python specific plugins
    Plug 'petobens/poet-v', { 'for': 'python' }

    " Language specific plugins
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'}

    Plug 'lervag/vimtex', { 'for': 'tex' }

    Plug 'christianrondeau/vim-base64'
    Plug 'cespare/vim-toml', { 'for': 'toml' }
    Plug 'alvan/vim-closetag'

    Plug 'gregsexton/MatchTag'
    Plug 'ap/vim-css-color'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

    " Only load these plugins when inside tmux"
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'wellle/tmux-complete.vim'
    Plug 'benmills/vimux'

call plug#end() " Finished Initialising Plugins
