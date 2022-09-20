local M = {}

function M.setup()
    require("dressing").setup({
        select = {
            backend = { "telescope", "builtin" },
        },
    })
end

return M
