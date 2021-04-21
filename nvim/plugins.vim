" Options for vim-plug
let g:plug_pwindow = 'vertical rightbelow new'
let g:plug_timeout = 300

call plug#begin('$HOME/.local/share/nvim/plugged')

    " General plugins
    Plug 'sainnhe/edge'

    " Status bar
    Plug 'itchyny/lightline.vim'
    source $NVIM_PLUGINS_CONFIG/lightline.vim

    " Startify, alternative startup screen
    Plug 'mhinz/vim-startify'
    source $NVIM_PLUGINS_CONFIG/startify.vim
    Plug 'dstein64/nvim-scrollview'
    source $NVIM_PLUGINS_CONFIG/scrollvim.vim
    Plug 'farmergreg/vim-lastplace'
    Plug 'blueyed/vim-diminactive'
    Plug 'danilamihailov/beacon.nvim'
    source $NVIM_PLUGINS_CONFIG/beacon.vim
    Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }

    " Language Parser
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'neovim/nvim-lspconfig'

    " Completion
    Plug 'hrsh7th/nvim-compe'

    " Linting
    Plug 'dense-analysis/ale'
    source $NVIM_PLUGINS_CONFIG/ale.vim

    " Testing framework in vim
    Plug 'vim-test/vim-test'
    source $NVIM_PLUGINS_CONFIG/test.vim

    " FZF
    Plug 'junegunn/fzf.vim'
    source $NVIM_PLUGINS_CONFIG/fzf.vim
    Plug 'stsewd/fzf-checkout.vim'
    source $NVIM_PLUGINS_CONFIG/fzf-checkout.vim

    " Mail
    Plug 'soywod/himalaya', {'rtp': 'vim'}

    " Other misc plugins
    Plug 'b3nj5m1n/kommentary'
    Plug 'chaoren/vim-wordmotion'
    Plug 'christianrondeau/vim-base64'
    Plug 'christoomey/vim-sort-motion'
    source $NVIM_PLUGINS_CONFIG/sort-motion.vim
    Plug 'gregsexton/MatchTag'
    Plug 'junegunn/vim-peekaboo'
    source $NVIM_PLUGINS_CONFIG/peekaboo.vim
    Plug 'mhinz/vim-signify'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'rhysd/git-messenger.vim'
    source $NVIM_PLUGINS_CONFIG/git-messenger.vim
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    source $NVIM_PLUGINS_CONFIG/fugitive.vim
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'alvan/vim-closetag'
    source $NVIM_PLUGINS_CONFIG/closetag.vim
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'yamatsum/nvim-cursorline'

    " Language specific plugins
    Plug 'cespare/vim-toml', { 'for': 'toml' }
    Plug 'chr4/nginx.vim', { 'for': 'nginx' }
    Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
    Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'html' }
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'}
    Plug 'lervag/vimtex', { 'for': 'tex' }
    source $NVIM_PLUGINS_CONFIG/tex.vim
    Plug 'petobens/poet-v', { 'for': 'python' }
    source $NVIM_PLUGINS_CONFIG/poet.vim
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    source $NVIM_PLUGINS_CONFIG/markdown.vim

    " Tmux stuff
    Plug 'benmills/vimux'
    source $NVIM_PLUGINS_CONFIG/vimux.vim
    Plug 'christoomey/vim-tmux-navigator'
    source $NVIM_PLUGINS_CONFIG/tmux-navigator.vim
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'wellle/tmux-complete.vim'

call plug#end() " Finished Initialising Plugins

" Configure the lua plugins
luafile $NVIM_PLUGINS_CONFIG/treesitter.lua
luafile $NVIM_PLUGINS_CONFIG/lsp.lua
luafile $NVIM_PLUGINS_CONFIG/compe.lua
luafile $NVIM_PLUGINS_CONFIG/kommentary.lua
luafile $NVIM_PLUGINS_CONFIG/colorizer.lua
luafile $NVIM_PLUGINS_CONFIG/autopairs.lua
