local tree = require("nvim-tree")
local M = {}

function M.setup()
    tree.setup({
        auto_close = true,
        view = {
            width = 40,
        },
    })
end

return M
