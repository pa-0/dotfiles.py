require("neogit").setup {
    disable_commit_confirmation = true,
    integrations = {
        diffview = true
    }
}

vim.api.nvim_set_keymap("n", "<leader>gs", '<cmd>lua require("neogit.status").create()<CR>', {noremap = true})
