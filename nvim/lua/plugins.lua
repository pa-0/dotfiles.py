vim.cmd("packadd packer.nvim")

local set_keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({ "nvim-lua/plenary.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })

    use({
        "famiu/nvim-reload",
        cmd = "Reload",
    })

    use({ "folke/tokyonight.nvim" })

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
        "rainbowhxch/beacon.nvim",
        config = function()
            require("beacon").setup({
                ignore_filetypes = { "alpha", "packer", "Trouble", "qf" },
            })

            set_keymap("n", "n", "n<cmd>Beacon<CR>", opts)
            set_keymap("n", "N", "N<cmd>Beacon<CR>", opts)
            set_keymap("n", "*", "*<cmd>Beacon<CR>", opts)
            set_keymap("n", "#", "#<cmd>Beacon<CR>", opts)
        end,
        event = "BufRead",
    })

    use({
        "yamatsum/nvim-cursorline",
        config = function()
            require("nvim-cursorline").setup({
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                },
            })
        end,
        event = "BufRead",
    })

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
        "kyazdani42/nvim-tree.lua",
        tag = "nightly",
        config = function()
            require("nvim-tree").setup({
                disable_netrw = true,
                view = {
                    width = 65,
                    side = "right",
                },
            })

            set_keymap("n", "\\\\", "<cmd>NvimTreeToggle", opts)
            set_keymap("n", "\\f", "<cmd>NvimTreeFindFile<CR>", opts)
            set_keymap("n", "\\q", "<cmd>NvimTreeClose<CR>", opts)
        end,
        cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    })

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

    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp").setup_lsp()
        end,
        after = "null_ls",
    })

    use({
        "JASONews/glow-hover",
        config = function()
            require("glow-hover").setup({
                max_width = 110,
                border = "rounded",
            })
        end,
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        as = "null_ls",
    })

    use({
        "L3MON4D3/LuaSnip",
        requires = {
            "rafamadriz/friendly-snippets",
        },
        as = "luasnip",
    })

    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.cmp").setup()
        end,
        requires = {
            "andersevenrud/cmp-tmux",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
        },
        after = { "luasnip", "null_ls" },
    })

    use({ "kevinhwang91/nvim-bqf", ft = "qf" })

    use({
        "vim-test/vim-test",
        config = function()
            require("plugins.test").setup()
        end,
        cmd = { "TestFile", "TestNearest" },
    })

    use({
        "ibhagwan/fzf-lua",
        config = function()
            require("plugins.fzf").setup()
        end,
        keys = { "<c-g><c-e>", "<c-g><c-s>", "<c-g><c-b>", "<c-g><c-l>" },
    })

    use({
        "sindrets/diffview.nvim",
        config = function()
            require("diffview.config").setup()

            set_keymap("n", "<leader>do", "<cmd>DiffviewOpen<CR>", opts)
            set_keymap("n", "<leader>dc", "<cmd>DiffviewClose<CR>", opts)
            set_keymap("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>", opts)
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

    use({
        "TimUntersberger/neogit",
        config = function()
            require("plugins.neogit").setup()
        end,
        cmd = "Neogit",
    })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({ ignore = "^$" })
        end,
        keys = { "gcc", { "v", "gc" } },
    })

    use({
        "christoomey/vim-sort-motion",
        config = function()
            vim.g.sort_motion_flags = "ui"
        end,
        keys = { "gs" },
    })

    use({
        "tpope/vim-repeat",
        key = { "." },
        event = "BufRead",
    })

    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    })

    use({
        "tpope/vim-unimpaired",
        event = "BufRead",
    })

    use({
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        run = "cd app && yarn install",
        cmd = "MarkdownPreview",
    })

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
end)
