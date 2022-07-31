local M = {}

function M.setup()
    require("neogit").setup({
        disable_commit_confirmation = true,
        commit_popup = {
            kind = "vsplit",
        },
        popup = {
            kind = "vsplit",
        },
    })
end

return M
