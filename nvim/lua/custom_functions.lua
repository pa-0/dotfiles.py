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

M.screen_share = function()
    local Path = require("plenary.path")
    local alacritty_config_path_string = "~/.config/alacritty/alacritty.yml"
    local alacritty_config_path = Path:new(alacritty_config_path_string)
    local alacritty_file_contents = alacritty_config_path:readlines()
    local size_line_index
    for i, line in ipairs(alacritty_file_contents) do
        -- Check for contents of line and see if size is there
        if string.find(line, "size") then
            size_line_index = i
        end
    end
    local size_config_string = alacritty_file_contents[size_line_index]

    -- split string
    local t = {}
    for str in string.gmatch(size_config_string, "([^" .. " " .. "]+)") do
        table.insert(t, str)
    end

    -- size value is always second value
    local current_size = tonumber(t[2])
    local big_size = 20.0
    local small_size = 14.5
    if current_size == small_size then
        alacritty_file_contents[size_line_index] = "  size: " .. big_size
        vim.wo.relativenumber = false
    elseif current_size == big_size then
        alacritty_file_contents[size_line_index] = "  size: " .. small_size
        vim.wo.relativenumber = true
    else
        error("Current size is not expected value:", current_size)
    end

    local alacritty_file_string = table.concat(alacritty_file_contents, "\n")
    alacritty_config_path:write(alacritty_file_string, "w")
end

return M
