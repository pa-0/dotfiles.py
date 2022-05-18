local nest = require("nest")

nest.applyKeymaps({
    {
        mode = "n",
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
        {
            "<leader>",
            {
                { "R", "<cmd>Reload<cr>", options = { noremap = true } },
                {
                    "t",
                    {
                        { "n", "<cmd>TestNearest<CR>" },
                        { "f", "<cmd>TestFile<CR>" },
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
                {
                    "g>",
                    {
                        { "<c-e>", "<cmd>lua require('fzf-lua').files()<cr>" },
                        { "<c-s>", "<cmd>lua require('fzf-lua').grep_project()<cr>" },
                        { "<c-b>", "<cmd>lua require('fzf-lua').buffers()<cr>" },
                        { "<c-l>", "<cmd>lua require('fzf-lua').blines()<cr>" },
                    },
                },
            },
        },
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
