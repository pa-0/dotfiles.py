local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local config_group = create_augroup("ConfigGroup", { clear = true })

create_autocmd("FocusLost", {
    group = config_group,
    pattern = "*",
    command = "silent! wa!",
})

create_autocmd({ "BufRead", "BufNewFile" }, {
    group = config_group,
    pattern = { "*.har" },
    command = "set filetype=json",
})

create_autocmd("Filetype", {
    group = config_group,
    pattern = { "gitcommit", "md", "tex", "txt" },
    command = "setlocal spell",
})

local terminal_config_group = create_augroup("TerminalConfig", { clear = true })

create_autocmd("TermOpen", {
    group = terminal_config_group,
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
})

create_autocmd("TermOpen", {
    group = terminal_config_group,
    pattern = "*",
    command = "startinser",
})

local wr_grpup = vim.api.nvim_create_augroup("WinResized", { clear = true })

create_autocmd("VimResized", {
    group = wr_grpup,
    pattern = "*",
    command = "wincmd =",
})
