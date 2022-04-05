-- Packer.nvim Plugins

vim.cmd("packadd packer.nvim")

require("packer").startup(function(use)
    -- Let Packer manage itself
    use("wbthomason/packer.nvim")

    -- Dependencies
    use("nvim-lua/plenary.nvim")
    use({
        "kyazdani42/nvim-web-devicons",
        event = "BufRead",
    })
    use("tami5/sqlite.lua")
    use({
        "nathom/filetype.nvim",
        config = function()
            require("filetype").setup({
                overrides = {},
            })
        end,
    })

    -- Reload config
    use({ "famiu/nvim-reload", cmd = "Reload" })

    -- Mappings made easy
    use({ "LionC/nest.nvim" })

    -- Colorschemes
    use({ "folke/tokyonight.nvim" })

    -- Make nvim prettier
    use({
        "goolord/alpha-nvim",
        config = function()
            require("plugins.alpha").setup()
        end,
    })

    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.statusline").setup()
        end,
        after = "nvim-web-devicons",
    })

    use({
        "danilamihailov/beacon.nvim",
        config = function()
            vim.g.beacon_ignore_filetypes = { "alpha", "packer", "Trouble", "qf" }
        end,
        event = "BufRead",
    })

    use({ "yamatsum/nvim-cursorline" })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                use_treesitter = true,
                filetype_exclude = { "alpha", "help", "man", "packer" },
            })
        end,
        event = { "BufRead" },
    })

    use({
        "elihunter173/dirbuf.nvim",
        cmd = "Dirbuf",
        config = function()
            require("dirbuf").setup({
                show_hidden = true,
                sort_order = "directories_first",
            })
        end,
    })

    -- Language Parser
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufRead" },
            { "windwp/nvim-ts-autotag", event = "BufRead" },
            { "p00f/nvim-ts-rainbow", event = "BufRead" },
        },
        config = function()
            require("plugins.treesitter").setup()
        end,
        event = { "BufRead" },
    })

    use({
        "chaoren/vim-wordmotion",
        event = "BufRead",
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp").setup_lsp()
        end,
        after = "null_ls",
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        as = "null_ls",
        event = "BufRead",
    })

    use({
        "tami5/lspsaga.nvim",
        config = function()
            require("lspsaga").setup()
        end,
        cmd = "Lspsaga",
    })

    -- Completion
    use({
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
    })

    use({
        "L3MON4D3/LuaSnip",
        after = "friendly-snippets",
        as = "luasnip",
    })

    use({
        "ray-x/lsp_signature.nvim",
        as = "lspsignature",
        after = "luasnip",
    })

    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.cmp").setup()
        end,
        after = { "nvim-autopairs", "luasnip", "lspsignature", "null_ls" },
    })

    use({
        "hrsh7th/cmp-nvim-lsp",
        after = "nvim-cmp",
    })

    use({
        "hrsh7th/cmp-buffer",
        after = "nvim-cmp",
    })

    use({
        "hrsh7th/cmp-path",
        after = "nvim-cmp",
    })

    use({
        "hrsh7th/cmp-cmdline",
        after = "nvim-cmp",
    })

    use({
        "andersevenrud/cmp-tmux",
        after = "nvim-cmp",
    })

    use({
        "ray-x/cmp-treesitter",
        after = "nvim-cmp",
    })

    use({
        "hrsh7th/cmp-emoji",
        after = "nvim-cmp",
    })

    use({
        "saadparwaiz1/cmp_luasnip",
        after = "nvim-cmp",
    })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                position = "right",
                mode = "document_diagnostics",
            })
        end,
        cmd = { "Trouble", "TroubleToggle" },
    })

    use({ "kevinhwang91/nvim-bqf", ft = "qf" })

    -- Testing
    use({
        "vim-test/vim-test",
        config = function()
            require("plugins.test").setup()
        end,
        cmd = { "TestFile", "TestNearest" },
    })

    -- Fuzzy finding
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.telescope").setup()
        end,
        key = { "<leader>f", "<leader>s", "<leader>l", "<leader>gb", "<leader>gc", "\"", { i = "<c-r>" } },
    })

    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })

    use("nvim-telescope/telescope-frecency.nvim")

    -- Git Stuff
    use({
        "TimUntersberger/neogit",
        config = function()
            require("plugins.neogit").setup()
        end,
        cmd = "Neogit",
    })

    use({
        "pwntester/octo.nvim",
        config = function()
            require("octo").setup()
        end,
        cmd = "Octo",
    })

    use({
        "sindrets/diffview.nvim",
        config = function()
            require("diffview.config").setup()
        end,
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    })

    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.gitsigns").setup()
        end,
        event = { "BufRead" },
    })

    --- Other misc plugins
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({ ignore = "^$" })
        end,
        keys = { "gcc", { "v", "gc" } },
    })

    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
        event = "BufRead",
    })

    use({
        "christoomey/vim-sort-motion",
        config = function()
            vim.g.sort_motion_flags = "ui"
        end,
        keys = { "gs" },
    })

    use({
        "tpope/vim-abolish",
        keys = { "crm", "crc", "crs", "cru", "cr-", "cr.", "cr<space>", "crt" },
    })

    use({
        "tpope/vim-eunuch",
        cmd = { "Rename", "Remove", "Move" },
    })

    use({
        "tpope/vim-repeat",
        key = { "." },
        event = "BufRead",
    })

    use({
        "tpope/vim-surround",
        event = "BUfRead",
    })

    use({
        "tpope/vim-unimpaired",
        event = "BufRead",
    })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = {
                    "TelescopePrompt",
                    "vim",
                    "gitcommit",
                    "NeogitCommitMessage",
                },
            })
        end,
        event = "InsertEnter",
    })

    -- Language specific plugins
    use({
        "mattn/emmet-vim",
        ft = { "html", "css", "scss" },
        keys = { "<c-y>," },
    })

    use({
        "Glench/Vim-Jinja2-Syntax",
        ft = { "html", "j2" },
    })

    use({
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        run = "cd app && yarn install",
    })

    -- Tmux stuff
    use({
        "benmills/vimux",
        config = function()
            require("plugins.vimux").setup()
        end,
        event = "BufRead",
    })

    use({
        "aserowy/tmux.nvim",
        config = function()
            require("tmux").setup({
                copy_sync = {
                    enable = false,
                },
                navigation = {
                    cycle_navigation = false,
                    enable_default_keybindings = true,
                },
            })
        end,
    })

    use({
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup()
        end,
        cmd = { "Twilight", "TwilightEnable" },
    })

    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                width = 240,
                plugins = {
                    tmux = {
                        enabled = true,
                    },
                },
            })
        end,
        cmd = "ZenMode",
    })
end)
