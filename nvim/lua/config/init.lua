local M = {}

function M.setup()
    require("config.options")
    require("config.builtin")
    require("config.keymaps")
    require("config.abbrevs")
    require("config.autocmd")
    require("config.commands")
end

return M
