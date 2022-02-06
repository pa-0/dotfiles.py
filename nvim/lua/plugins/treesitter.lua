local treesitter = require("nvim-treesitter.configs")
local M = {}

function M.setup()
    treesitter.setup({
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
            "make",
            "python",
            "regex",
            "rst",
            "rust",
            "scss",
            "toml",
            "typescript",
            "vim",
            "vue",
            "yaml",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        highlight = {
            enable = true,
        },
        rainbow = {
            enable = true,
        },
        autotag = {
            enable = true,
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
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ib"] = "@block.inner",
                    ["ab"] = "@block.outer",
                    ["ak"] = "@comment.outer",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },
    })
end

return M
