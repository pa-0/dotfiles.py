-- Install packed if not installed.
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/opt/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    execute "packadd packer.nvim"
end

-- Packer.nvim Plugins
require("packer").startup {
    function()
        -- Let Packer manage itself
        use "wbthomason/packer.nvim"

        -- Colorscheme
        use "sainnhe/edge"

        -- Make nvim prettier
        -- use {
        --     "itchyny/lightline.vim",
        --     config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/lightline.vim ]]
        -- }
        use {
            "hoob3rt/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true},
            config = function()
                require "plugins.lualine"
            end
        }
        use {
            "mhinz/vim-startify",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/startify.vim ]]
        }
        use {
            "dstein64/nvim-scrollview",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/scrollvim.vim ]]
        }
        use "farmergreg/vim-lastplace"
        use "blueyed/vim-diminactive"
        use {
            "danilamihailov/beacon.nvim",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/beacon.vim ]]
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            branch = "lua"
        }

        -- Language Parser
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require "plugins.treesitter"
            end
        }

        use {
            "neovim/nvim-lspconfig",
            config = function()
                require "plugins.lsp"
            end
        }

        -- Completion Framework
        use {
            "hrsh7th/nvim-compe",
            config = function()
                require "plugins.compe"
            end
        }

        -- Linters and fixers
        use {
            "dense-analysis/ale",
            confg = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/ale.vim ]]
        }

        -- Testing
        use {
            "vim-test/vim-test",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/test.vim ]]
        }

        -- Fuzzy finding
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
            config = function()
                require "plugins.telescope"
            end
        }

        --- Other misc plugins
        use {
            "b3nj5m1n/kommentary",
            config = function()
                require "plugins.kommentary"
            end
        }
        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require "colorizer".setup()
            end
        }
        use "chaoren/vim-wordmotion"
        use "christianrondeau/vim-base64"
        use {
            "christoomey/vim-sort-motion",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/sort-motion.vim ]]
        }
        use "gregsexton/MatchTag"
        use {
            "junegunn/vim-peekaboo",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/peekaboo.vim ]]
        }
        use "mhinz/vim-signify"
        use "p00f/nvim-ts-rainbow"
        use {
            "rhysd/git-messenger.vim",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/git-messenger.vim ]]
        }
        use "tpope/vim-abolish"
        use "tpope/vim-eunuch"
        use {
            "tpope/vim-fugitive",
            opt = true,
            cmd = {"G", "Gread", "Gwrite"},
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/fugitive.vim ]]
        }
        use "tpope/vim-repeat"
        use "tpope/vim-surround"
        use "tpope/vim-unimpaired"
        use {
            "alvan/vim-closetag",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/closetag.vim ]]
        }
        use "windwp/nvim-ts-autotag"
        use "yamatsum/nvim-cursorline"

        -- Language specific plugins
        use {
            "cespare/vim-toml",
            ft = {"toml"}
        }
        use {
            "chr4/nginx.vim",
            ft = {"nginx"}
        }
        use {
            "ekalinin/Dockerfile.vim",
            ft = {"Dockerfile"}
        }
        use {
            "Glench/Vim-Jinja2-Syntax",
            ft = {"html", "j2"}
        }
        use {
            "iamcco/markdown-preview.nvim",
            ft = {"markdown"},
            run = "cd app && yarn install"
        }
        use {
            "plasticboy/vim-markdown",
            ft = {"markdown"},
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/markdown.vim ]]
        }
        use {
            "lervag/vimtex",
            ft = {"tex"},
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/tex.vim ]]
        }
        use {
            "petobens/poet-v",
            ft = {"python"},
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/poet.vim ]]
        }

        -- Tmux stuff
        use {
            "benmills/vimux",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/vimux.vim ]]
        }
        use {
            "christoomey/vim-tmux-navigator",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/tmux-navigator.vim ]]
        }
        use "tmux-plugins/vim-tmux-focus-events"
        use "wellle/tmux-complete.vim"
    end
}
