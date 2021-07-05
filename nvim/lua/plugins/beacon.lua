-- Beacon config
vim.g.beacon_show_jump = 0
vim.g.beacon_ignore_filetypes = {"fzf", "Plugins", "Startify", "Register"}

-- Use beacon whenever jumping in searches
vim.api.nvim_set_keymap("n", "nzz", "n:Beacon<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "Nzz", "N:Beacon<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "*zz", "*:Beacon<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "#zz", "#:Beacon<CR>", {silent = true})
