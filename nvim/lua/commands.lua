local function define_command()
    vim.cmd("command! Notes lua require('custom_functions').notes_cmd()")
end

define_command()
