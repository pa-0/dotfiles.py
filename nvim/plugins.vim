scriptencoding utf-8

" Options for vim-plug
let g:plug_pwindow = 'vertical rightbelow new'
let g:plug_timeout = 300

call plug#begin('$HOME/.local/share/nvim/plugged')

    " General plugins
    Plug 'glepnir/zephyr-nvim'

    " Lightline
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'
    Plug 'niklaas/lightline-gitdiff'

    " Startify, alternative startup screen
    Plug 'mhinz/vim-startify'
    Plug 'dstein64/nvim-scrollview'
    Plug 'farmergreg/vim-lastplace'

    " Language Parser
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " Completion stuff
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
    Plug 'deoplete-plugins/deoplete-zsh', { 'for': 'sh' }
    Plug 'deoplete-plugins/deoplete-docker', { 'for': 'Dockerfile' }
    Plug 'deoplete-plugins/deoplete-dictionary'
    Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rs' }
    Plug 'davidhalter/jedi-vim', { 'for': 'python' }

    " Linting
    Plug 'dense-analysis/ale'

    " Testing framework in vim
    Plug 'vim-test/vim-test'

    " FZF
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'

    " Other misc plugins
    Plug 'alvan/vim-closetag'
    Plug 'ap/vim-css-color'
    Plug 'chaoren/vim-wordmotion'
    Plug 'christianrondeau/vim-base64'
    Plug 'christoomey/vim-sort-motion'
    Plug 'dominikduda/vim_current_word'
    Plug 'gregsexton/MatchTag'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'junegunn/vim-peekaboo'
    Plug 'junegunn/vim-slash'
    Plug 'mhinz/vim-signify'
    Plug 'rhysd/git-messenger.vim'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    " Python specific plugins
    Plug 'petobens/poet-v', { 'for': 'python' }

    " Language specific plugins
    Plug 'cespare/vim-toml', { 'for': 'toml' }
    Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'}
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

    " Tmux stuff
    Plug 'benmills/vimux'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'wellle/tmux-complete.vim'

call plug#end() " Finished Initialising Plugins
