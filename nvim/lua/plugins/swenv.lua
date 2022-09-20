local M = {}

function M.setup()
    require("swenv").setup({
        venvs_path = vim.fn.expand("$HOME/.local/share/virtualenvs"),
        post_set_venv = function(_)
            vim.cmd("LspRestart")
        end,
    })
end

return M
