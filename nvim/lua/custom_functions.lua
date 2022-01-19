local M = {}

function M.notes_cmd()
    local v_split_width = 120
    -- local cwd = vim.fn.getcwd()

    vim.api.nvim_set_current_dir(vim.fn.expand("$DB_DIR"))
    vim.cmd(v_split_width .. "vsplit | Dirbuf | cd -")
    -- This should run only when the split is closed!
    -- Or do not change directory whatsoever and create a custom
    -- keybinding for running neogit in DB_DIR instead
    -- vim.api.nvim_set_current_dir(cwd)
end

return M
