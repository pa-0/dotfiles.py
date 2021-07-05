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
        use "navarasu/onedark.nvim"

        -- Make nvim prettier
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
            "ethanholz/nvim-lastplace",
            config = function()
                require("nvim-lastplace").setup()
            end
        }

        use {
            "danilamihailov/beacon.nvim",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/beacon.vim ]]
        }

        use "lukas-reineke/indent-blankline.nvim"

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

        use "ray-x/lsp_signature.nvim"

        -- Completion Framework
        use {
            "hrsh7th/nvim-compe",
            config = function()
                require "plugins.compe"
            end
        }

        -- Snippets
        use "hrsh7th/vim-vsnip"
        use "GoldsteinE/compe-latex-symbols"
        use "andersevenrud/compe-tmux"
        use {
            "tamago324/compe-zsh",
            require = {"nvim-lua/plenary.nvim", "Shougo/deol.nvim"}
        }

        -- Linters and fixers
        use {
            "dense-analysis/ale",
            confg = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/ale.vim ]]
        }

        -- Testing
        use {
            "vim-test/vim-test",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/test.vim ]],
            cmd = {"TestFile", "TestNearest"},
            keys = {"<leader>t"}
        }

        -- Fuzzy finding
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
            config = function()
                require "plugins.telescope"
            end,
            cmd = {"Telescope", "GBranch"},
            keys = {"gfg", "gff", "gfb"}
        }

        --- Other misc plugins
        use {
            "b3nj5m1n/kommentary",
            config = function()
                require "plugins.kommentary"
            end,
            keys = {"gcc", {"v", "gc"}}
        }

        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require "colorizer".setup()
            end
        }

        use "chaoren/vim-wordmotion"

        use {
            "christianrondeau/vim-base64",
            keys = {"<leader>atob", "<leader>btoa"}
        }

        use {
            "christoomey/vim-sort-motion",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/sort-motion.vim ]],
            keys = {"gs"}
        }

        use {
            "gregsexton/MatchTag",
            ft = {"html"}
        }

        use {
            "junegunn/vim-peekaboo",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/peekaboo.vim ]]
        }

        use {
            "lewis6991/gitsigns.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            config = function()
                require("gitsigns").setup {}
            end
        }

        use {
            "sindrets/diffview.nvim",
            config = function()
                require("diffview.config").setup {}
            end,
            cmd = {"DiffviewOpen"}
        }

        use "windwp/nvim-ts-autotag"

        use "p00f/nvim-ts-rainbow"

        use {
            "rhysd/git-messenger.vim",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/git-messenger.vim ]],
            cmd = {"GitMessenger"}
        }

        use {
            "tpope/vim-abolish",
            keys = {"crm", "crc", "crs", "cru", "cr-", "cr.", "cr<space>", "crt"}
        }

        use {
            "tpope/vim-eunuch",
            keys = {"Delete", "Rename"}
        }

        use {
            "tpope/vim-fugitive",
            opt = true,
            cmd = {"G", "Gread", "Gwrite", "Gdiff", "Gblame"},
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/fugitive.vim ]]
        }

        use "tpope/vim-repeat"

        use "tpope/vim-surround"

        use "tpope/vim-unimpaired"

        use {
            "alvan/vim-closetag",
            config = vim.cmd [[ source $NVIM_PLUGINS_CONFIG/closetag.vim ]],
            ft = {"html"}
        }

        use "yamatsum/nvim-cursorline"

        use {
            "steelsojka/pears.nvim",
            config = function()
                require("pears").setup()
            end
        }

        -- Language specific plugins
        use {
            "chr4/nginx.vim",
            ft = {"nginx"}
        }

        use {
            "mattn/emmet-vim",
            ft = {"html", "css", "scss"},
            keys = {"<c-y>,"}
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
    end
}
