vim.cmd("packadd packer.nvim")

require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({ "nvim-lua/plenary.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    use({
        "stevearc/dressing.nvim",
        config = function()
            require("plugins.dressing").setup()
        end,
    })

    use({
        "folke/tokyonight.nvim",
        config = function()
            local color = require("color")
            color.setup()
            color.set_colorscheme()
        end,
    })

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
        "yamatsum/nvim-cursorline",
        config = function()
            require("plugins.cursorline").setup()
        end,
        event = "BufRead",
    })

    use({
        "mvllow/modes.nvim",
        tag = "v0.2.0",
        config = function()
            require("plugins.modes").setup()
        end,
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.blankline").setup()
        end,
        event = { "BufRead" },
    })

    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plugins.tree").setup()
        end,
        cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufRead" },
            { "windwp/nvim-ts-autotag", event = "BufRead" },
            { "mrjones2014/nvim-ts-rainbow", event = "BufRead" },
        },
        config = function()
            require("plugins.treesitter").setup()
        end,
        event = { "BufRead" },
    })

    use({
        "m4xshen/autoclose.nvim",
        config = function()
            require("plugins.autoclose").setup()
        end,
    })

    use({
        "chaoren/vim-wordmotion",
        event = "BufRead",
    })

    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp").setup()
        end,
        after = "null_ls",
    })

    use({
        "JASONews/glow-hover",
        config = function()
            require("plugins.glow").setup()
        end,
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        as = "null_ls",
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
            "onsails/lspkind.nvim",
        },
        after = { "null_ls" },
    })

    use({
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    })

    use({
        "vim-test/vim-test",
        config = function()
            require("plugins.test").setup()
        end,
        cmd = { "TestFile", "TestNearest", "TestSuite" },
    })

    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.telescope").setup()
        end,
        cmd = "Telescope",
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
        },
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

    use({
        "Almo7aya/openingh.nvim",
        cmd = { "OpenInGHFile", "OpenInGHRepo" },
    })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.comment").setup()
        end,
        keys = { "gcc", { "v", "gc" } },
    })

    use({
        "christoomey/vim-sort-motion",
        config = function()
            require("plugins.sort-motion").setup()
        end,
        keys = { "gs" },
    })

    use({
        "nat-418/boole.nvim",
        config = function()
            require("plugins.boole").setup()
        end,
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
        "preservim/vimux",
        config = function()
            require("plugins.vimux").setup()
        end,
        event = "BufRead",
    })

    use({
        "aserowy/tmux.nvim",
        config = function()
            require("plugins.tmux").setup()
        end,
    })

    use({ "hashivim/vim-terraform" })
    use({ "raimon49/requirements.txt.vim" })
    use({ "NoahTheDuke/vim-just" })
    use({
        "AckslD/swenv.nvim",
        config = function()
            require("plugins.swenv").setup()
        end,
    })

    use({ "tamton-aquib/duck.nvim" })
end)
