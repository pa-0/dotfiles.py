local M = {}

function M.setup()
    local fzf_lua = require("fzf-lua")
    local set_keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    set_keymap("n", "<c-g><c-e>", fzf_lua.files, opts)
    set_keymap("n", "<c-g><c-s>", fzf_lua.live_grep, opts)
    set_keymap("n", "<c-g><c-b>", fzf_lua.buffers, opts)
    set_keymap("n", "<c-g><c-l>", fzf_lua.blines, opts)

    fzf_lua.setup({
        winopts = {
            width = 0.87,
        },
    })
end

return M
