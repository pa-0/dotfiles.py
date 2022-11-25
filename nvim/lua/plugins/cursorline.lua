local M = {}

function M.setup()
    require("nvim-cursorline").setup({
        cursorline = {
            enable = false,
        },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
        },
    })
end

return M
