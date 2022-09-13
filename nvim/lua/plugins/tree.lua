local M = {}

function M.setup()
    require("nvim-tree").setup({
        disable_netrw = true,
        view = {
            width = 65,
            side = "right",
        },
    })
end

return M
