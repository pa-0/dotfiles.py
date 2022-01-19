local function notes_command()
    vim.cmd("command! Notes lua require('custom_functions').notes_cmd()")
end

notes_command()
