local M = {}

function M.setup()
    require("glow-hover").setup({
        max_width = 110,
        border = "rounded",
    })
end

return M
