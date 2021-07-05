vim.g.tmux_navigator_save_on_switch = 1
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.g.tmux_navigator_no_mappings = 1

vim.api.nvim_set_keymap("n", "<c-h>", ":TmuxNavigateLeft<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<c-j>", ":TmuxNavigateDown<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<c-k>", ":TmuxNavigateUp<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<c-l>", ":TmuxNavigateRight<CR>", {silent = true})
