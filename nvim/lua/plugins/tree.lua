vim.api.nvim_set_keymap("n", "<Tab><Tab>", ":NvimTreeToggle<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Tab>f", ":NvimTreeFindFile<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Tab>q", ":NvimTreeClose<CR>", {noremap = true})
