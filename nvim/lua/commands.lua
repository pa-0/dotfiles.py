local function screen_share_command()
    vim.cmd("command! ScreenShare lua require('custom_functions').screen_share()")
end

local function activate_command()
    vim.cmd("command! Virtualenv lua require('swenv.api').pick_venv()")
end

screen_share_command()
activate_command()
