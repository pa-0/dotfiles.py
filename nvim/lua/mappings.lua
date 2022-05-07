local nest = require("nest")

vim.g.mapleader = ","

nest.applyKeymaps({
    {
        mode = "n",
        {
            "<leader>",
            {
                { "w", "<cmd>w<cr>" },
                { "W", "<cmd>wa!<cr>" },
                { "e", "<cmd>wq!<cr>" },
                { "q", "<cmd>q!<cr>" },
                { "Q", "<cmd>qa!<cr>" },
                { "R", "<cmd>Reload<cr>", options = { noremap = true } },
                { "f", "<cmd>lua require('fzf-lua').git_files()<cr>" },
                { "s", "<cmd>lua require('fzf-lua').grep_project()<cr>" },
                { "l", "<cmd>lua require('fzf-lua').blines()<cr>" },
                { "b", "<cmd>lua require('fzf-lua').buffers()<cr>" },
                {
                    "t",
                    {
                        { "n", "<cmd>TestNearest<CR>" },
                        { "f", "<cmd>TestFile<CR>" },
                    },
                },
                {
                    "g",
                    {
                        { "s", "<cmd>Neogit kind=split_above<cr>" },
                    },
                },
                {
                    "d",
                    {
                        { "o", "<cmd>DiffviewOpen<cr>" },
                        { "c", "<cmd>DiffviewClose<cr>" },
                        { "h", "<cmd>DiffviewFileHistory<cr>" },
                    },
                },
            },
        },
        {
            "\\",
            {
                { "\\", "<cmd>NvimTreeToggle<cr>" },
                { "f", "<cmd>NvimTreeFindFileToggle<cr>" },
                { "q", "<cmd>NvimTreeClose<cr>" },
            },
        },
        {
            "<c-",
            {
                { "e>", "3<c-e>" },
                { "y>", "3<c-y>" },
                { "w>V<c-w>v", "<cmd>term<cr>" },
                { "w>ts <c-w>s", "<cmd>term<cr." },
            },
        },
        {
            "t",
            {
                { "w", "<cmd>Twilight<cr>" },
                { "a", "<cmd>TZAtaraxis<cr>" },
            },
        },
        { "<space>", "<cmd>silent noh <Bar>echo<cr>:syn sync fromstart<cr>" },
        { "<bs>", "<c-^>" },
        { "\"", "<cmd>lua require('fzf-lua').registers()<cr>" },
        { "^", "g^" },
        { "0", "g0" },
        { "$", "g$" },
        { "n", "n<cmd>Beacon<CR>" },
        { "N", "N<cmd>Beacon<CR>" },
        { "*", "*<cmd>Beacon<CR>" },
        { "#", "#<cmd>Beacon<CR>" },
        options = { noremap = true, silent = true },
    },
    {
        mode = "i",
        {
            { "<c-r>", "<cmd>lua require('fzf-lua').registers()<cr>" },
        },
    },
    {
        mode = "v",
        {
            { "<", "<gv" },
            { ">", ">gv" },
        },
    },
    {
        mode = "c",
        {
            { "<c-a>", "<home>" },
            { "<c-e>", "<end>" },
        },
    },
    {
        mode = "t",
        {
            { "<c-h>", "<-\\><c-n><c-w><c-h>" },
            { "<c-j>", "<-\\><c-n><c-w><c-j>l" },
            { "<c-k>", "<-\\><c-n><c-w><c-k>l" },
            { "<c-l>", "<-\\><c-n><c-w><c-l>l" },
        },
    },
})

vim.api.nvim_exec(
    [[
    augroup terminalConfig
        au!
        autocmd TermOpen * setlocal nonumber norelativenumber
        autocmd TermOpen * startinser
    augroup END
]],
    true
)
