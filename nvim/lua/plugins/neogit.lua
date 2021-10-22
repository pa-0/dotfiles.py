local neogit = require("neogit")
local M

function M.setup()
    neogit.setup({
        disable_commit_confirmation = true,
        integrations = {
            diffview = true,
        },
    })
end

return M
