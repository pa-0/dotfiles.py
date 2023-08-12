return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "sindrets/diffview.nvim",
    },
    config = true,
    opts = {
        kind = "vsplit",
        integrations = {
            telescope = true,
            diffview = true,
        },
    },
    keys = {
        { "<c-g><c-g>", "<cmd>Neogit<CR>" },
    },
    cmd = "Neogit",
    lazy = true,
}
