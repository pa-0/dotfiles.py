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

        -- Dependencies
        use "nvim-lua/plenary.nvim"
        use "kyazdani42/nvim-web-devicons"

        -- Reload config
        use "famiu/nvim-reload"

        -- Colorscheme
        use "folke/tokyonight.nvim"

        vim.o.background = "dark"
        vim.g.theme = "tokyonight"
        vim.g.tokyonight_style = "storm"
        vim.cmd("colorscheme " .. vim.g.theme)

        -- Make nvim prettier
        use {
            "hoob3rt/lualine.nvim",
            config = function()
                require("plugins.statusline")
            end
        }

        use {
            "mhinz/vim-startify",
            config = function()
                require("plugins.startify")
            end
        }

        use {
            "ethanholz/nvim-lastplace",
            config = function()
                require("nvim-lastplace").setup(
                    {
                        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                        lastplace_ignore_filetype = {"gitcommit", "gitrebase"}
                    }
                )
            end
        }

        use {
            "danilamihailov/beacon.nvim",
            config = function()
                require("plugins.beacon")
            end
        }

        use "yamatsum/nvim-cursorline"

        use "lukas-reineke/indent-blankline.nvim"

        use {
            "kyazdani42/nvim-tree.lua",
            config = function()
                require "plugins.tree"
            end,
            cmd = {"NvimTreeToggle", "NvimTreeFindFile", "NvimTreeClose"},
            keys = {"<Tab><Tab>", "<Tab>f", "<Tab>q"}
        }

        use {
            "projekt0n/circles.nvim",
            requires = {
                {"kyazdani42/nvim-tree.lua", opt = true}
            },
            config = function()
                require("circles").setup()
            end
        }

        -- Language Parser
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            requires = {
                "nvim-treesitter/nvim-treesitter-textobjects",
                "windwp/nvim-ts-autotag",
                "p00f/nvim-ts-rainbow"
            },
            config = function()
                require("plugins.treesitter")
            end
        }

        -- LSP
        use {
            "neovim/nvim-lspconfig",
            requires = "ray-x/lsp_signature.nvim",
            config = function()
                require("plugins.lsp")
            end
        }

        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("lspkind").init()
            end
        }

        use {
            "hrsh7th/nvim-compe",
            requires = {
                "andersevenrud/compe-tmux",
                {"GoldsteinE/compe-latex-symbols", ft = "tex"},
                {"tamago324/compe-zsh", ft = {"sh", "zsh"}, requires = "Shougo/deol.nvim"}
            },
            config = function()
                require("plugins.compe")
            end
        }

        use {
            "folke/trouble.nvim",
            config = function()
                require("trouble").setup()
            end
        }

        use "kevinhwang91/nvim-bqf"

        -- Linters and fixers
        use {
            "dense-analysis/ale",
            config = function()
                require("plugins.ale")
            end
        }

        -- Testing
        use {
            "vim-test/vim-test",
            config = function()
                require("plugins.test")
            end,
            cmd = {"TestFile", "TestNearest"},
            keys = {"<leader>tf", "<leader>tn"}
        }

        -- Fuzzy finding
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make"
            },
            config = function()
                require("plugins.telescope")
            end
        }

        -- Git Stuff
        use {
            "TimUntersberger/neogit",
            cmd = "Neogit",
            keys = "<leader>gs",
            config = function()
                require("plugins.neogit")
            end
        }

        use {
            "sindrets/diffview.nvim",
            config = function()
                require("diffview.config").setup()
            end,
            cmd = {"DiffviewOpen"}
        }

        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins.gitsigns")
            end
        }

        use {
            "pwntester/octo.nvim",
            config = function()
                require("octo").setup()
            end
        }
        --- Other misc plugins
        use {
            "b3nj5m1n/kommentary",
            config = function()
                require("plugins.kommentary")
            end,
            keys = {"gcc", {"v", "gc"}}
        }

        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end
        }

        use "chaoren/vim-wordmotion"

        use {
            "christianrondeau/vim-base64",
            keys = {"<leader>atob", "<leader>btoa"}
        }

        use {
            "christoomey/vim-sort-motion",
            config = function()
                require("plugins.sort-motion")
            end,
            keys = {"gs"}
        }

        use {
            "gregsexton/MatchTag",
            ft = {"html"}
        }

        use {
            "tpope/vim-abolish",
            keys = {"crm", "crc", "crs", "cru", "cr-", "cr.", "cr<space>", "crt"}
        }

        use "tpope/vim-eunuch"

        use "tpope/vim-repeat"

        use "tpope/vim-surround"

        use "tpope/vim-unimpaired"

        use {
            "alvan/vim-closetag",
            config = function()
                require("plugins.closetag")
            end,
            ft = {"html"}
        }

        use {
            "steelsojka/pears.nvim",
            config = function()
                require("pears").setup()
            end
        }

        use {
            "folke/twilight.nvim",
            config = function()
                require("twilight").setup()
            end,
            cmd = "Twilight"
        }

        use {
            "caenrique/swap-buffers.nvim",
            config = function()
                require("plugins.buffers")
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
            config = function()
                require("plugins.poet")
            end
        }

        -- Tmux stuff
        use {
            "benmills/vimux",
            config = function()
                require("plugins.vimux")
            end,
            cmd = "VimuxRunCommand"
        }

        use {
            "christoomey/vim-tmux-navigator",
            config = function()
                require("plugins.tmux-navigator")
            end
        }

        use "tmux-plugins/vim-tmux-focus-events"
    end
}
