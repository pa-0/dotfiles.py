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
    autotag = {
        enable = true
    },
    -- Indent is not working
    -- Ref.: https://github.com/nvim-treesitter/nvim-treesitter/issues/802
    -- indent = {
    --     enable =
    -- }

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["if"] = {
                    python = "(function_definition) @function",
                    javascript = "(function_definition) @function"
                },
                ["af"] = {
                    python = "(function_definition) @function.outer",
                    javascript = "(function_definition) @function.outer"
                }
            }
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer"
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer"
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer"
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer"
            }
        }
    }
}

-- Set up folding
-- set foldexpr=nvim_treesitter#foldexpr()
-- set foldmethod=expr
