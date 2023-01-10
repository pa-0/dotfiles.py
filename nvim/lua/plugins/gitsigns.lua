return {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
    event = { "BufRead" },
    keys = {
        {
            "]c",
            function()
                require("gitsigns").next_hunk()
            end,
        },
        {
            "[c",
            function()
                require("gitsigns").prev_hunk()
            end,
        },
    },
}
