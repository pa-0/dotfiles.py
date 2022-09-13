local M = {}

function M.setup()
    require("tmux").setup({
        copy_sync = {
            enable = false,
        },
        navigation = {
            cycle_navigation = false,
            enable_default_keybindings = true,
        },
    })
end

return M
