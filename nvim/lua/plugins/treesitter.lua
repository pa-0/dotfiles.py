--  nvim-treesitter configuration

require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "bash",
        "c",
        "comment",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "python",
        "regex",
        "rst",
        "rust",
        "toml",
        "typescript",
        "vue",
        "yaml"
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    highlight = {
        enable = true
    },
    rainbow = {
        enable = true
    },
    autopairs = {
        enable = true
    }
    -- Indent is not working
    -- Ref.: https://github.com/nvim-treesitter/nvim-treesitter/issues/802
    -- indent = {
    --     enable =
    -- }
}

-- Set up folding
-- set foldexpr=nvim_treesitter#foldexpr()
-- set foldmethod=expr
