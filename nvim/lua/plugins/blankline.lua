local M = {}

function M.setup()
    require("indent_blankline").setup({
        use_treesitter = true,
        filetype_exclude = { "alpha", "help", "man", "packer" },
    })
end

return M
