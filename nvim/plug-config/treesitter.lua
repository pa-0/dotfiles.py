--  nvim-treesitter configuration

require "nvim-treesitter.configs".setup {
    ensure_installed = {"bash", "c", "html", "javascript", "json", "python", "regex", "rst", "rust", "toml", "yaml"},
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}

-- Set up folding
-- set foldexpr=nvim_treesitter#foldexpr()
-- set foldmethod=expr
