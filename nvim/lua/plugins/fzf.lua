local M = {}

function M.setup()
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({
        winopts = {
            width = 0.87,
        },
    })
end

return M
