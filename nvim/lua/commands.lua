local function notes_command()
    vim.cmd("command! Notes lua require('custom_functions').notes_cmd()")
end

local function screen_share_command()
    vim.cmd("command! ScreenShare lua require('custom_functions').screen_share()")
end

notes_command()
screen_share_command()
