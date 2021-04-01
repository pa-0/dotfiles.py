--  nvim-treesitter configuration

require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "bash",
        "c",
        "comment",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "regex",
        "rst",
        "rust",
        "toml",
        "yaml"
    },
    highlight = {
        enable = true
    },
    rainbow = {
        enable = true
    },
    autotag = {
        enable = true
        -- TODO: To figure out how to make this plugin work with django templates/jinja templates
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
