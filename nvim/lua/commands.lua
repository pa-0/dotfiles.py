local function screen_share_command()
    vim.cmd("command! ScreenShare lua require('custom_functions').screen_share()")
end

local function activate_command()
    vim.cmd("command! Virtualenv lua require('swenv.api').pick_venv()")
end

local function ducks()
    vim.cmd("command! DuckHatch lua require('duck').hatch()")
    vim.cmd("command! DuckCook lua require('duck').cook()")
end

local function aoc_run()
    vim.cmd("command! TestAdventOfCode call VimuxRunCommand(\"python main.py\")")
    vim.cmd("command! AdventOfCode call VimuxRunCommand(\"python main.py --no-test\")")
end

screen_share_command()
activate_command()
ducks()
aoc_run()
