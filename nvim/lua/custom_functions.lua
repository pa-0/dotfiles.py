local M = {}

function M.notes_cmd()
    local v_split_width = 120
    local cwd = vim.fn.getcwd()

    vim.api.nvim_set_current_dir(vim.fn.expand("$DB_DIR"))
    vim.cmd(v_split_width .. "vsplit | Dirbuf")
    vim.api.nvim_set_current_dir(cwd)
end

return M
