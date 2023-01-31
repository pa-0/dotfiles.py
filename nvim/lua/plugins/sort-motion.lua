return {
    "christoomey/vim-sort-motion",
    config = function()
        vim.g.sort_motion_flags = "ui"
    end,
    keys = {
        { "gs", mode = "v" },
    },
}
