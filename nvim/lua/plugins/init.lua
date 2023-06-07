return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "kyazdani42/nvim-web-devicons",
        lazy = true,
    },
    {
        "chaoren/vim-wordmotion",
        event = "BufRead",
    },
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    },
    {
        "Almo7aya/openingh.nvim",
        cmd = { "OpenInGHFile", "OpenInGHRepo" },
    },
    {
        "tpope/vim-unimpaired",
        event = "BufRead",
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        build = "cd app && yarn install",
        cmd = "MarkdownPreview",
    },
    {
        "eandrju/cellular-automaton.nvim",
        cmd = { "CellularAutomaton" },
    },
    {
        "rcarriga/nvim-notify",
    },
    {
        "MunifTanjim/nui.nvim",
    },
}
