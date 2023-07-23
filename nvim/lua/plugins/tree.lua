return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        disable_netrw = true,
        view = {
            width = 65,
            side = "right",
        },
    },
    cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    keys = {
        { "<leader>l", "<cmd>NvimTreeToggle<CR>" },
        { "<leader>lf", "<cmd>NvimTreeFindFile<CR>" },
        { "<leader>lq", "<cmd>NvimTreeClose<CR>" },
    },
}
