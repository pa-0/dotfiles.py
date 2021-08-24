vim.g["test#enabled_runner"] = {"python#pytest"}
vim.g["test#strategy"] = "vimux"
vim.g["test#python#runner"] = "pytest"
vim.g["test#python#pytest#options"] = {
    nearest = "-lsxv --durations=3",
    file = '-qk ""',
    suite = '--color yes -qk ""'
}

vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", {noremap = true})
