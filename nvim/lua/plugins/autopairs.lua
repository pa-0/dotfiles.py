local M = {}

function M.setup()
    require("nvim-autopairs").setup({
        disable_filetypes = { "fzf" },
    })
end

return M
