local function screen_share_command()
    vim.cmd("command! ScreenShare lua require('custom_functions').screen_share()")
end

screen_share_command()
