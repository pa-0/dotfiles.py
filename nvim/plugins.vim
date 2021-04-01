" Options for vim-plug
let g:plug_pwindow = 'vertical rightbelow new'
let g:plug_timeout = 300

call plug#begin('$HOME/.local/share/nvim/plugged')

    " General plugins
    Plug 'sainnhe/edge'

    " Status bar
    Plug 'ourigen/skyline.vim'

    " Startify, alternative startup screen
    Plug 'mhinz/vim-startify'
    Plug 'dstein64/nvim-scrollview'
    Plug 'farmergreg/vim-lastplace'

    " Language Parser
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'autozimu/LanguageClient-neovim', { 'do': 'bash install.sh' }

    " Completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-lsp'

    " Linting
    Plug 'dense-analysis/ale'

    " Testing framework in vim
    Plug 'vim-test/vim-test'

    " FZF
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'

    " Other misc plugins
    Plug 'alvan/vim-closetag'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'chaoren/vim-wordmotion'
    Plug 'christianrondeau/vim-base64'
    Plug 'christoomey/vim-sort-motion'
    Plug 'yamatsum/nvim-cursorline'
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

    " Language specific plugins
    Plug 'cespare/vim-toml', { 'for': 'toml' }
    Plug 'chr4/nginx.vim', { 'for': 'nginx' }
    Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
    Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'html' }
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'}
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'petobens/poet-v', { 'for': 'python' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

    " Tmux stuff
    Plug 'benmills/vimux'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'wellle/tmux-complete.vim'

call plug#end() " Finished Initialising Plugins
