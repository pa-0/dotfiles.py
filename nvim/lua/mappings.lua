local nest = require("nest")

vim.g.mapleader = ","

nest.applyKeymaps {
    {
        mode = "n",
        {
            "<leader>",
            {
                {"w", "<cmd>w<cr>"},
                {"W", "<cmd>wa!<cr>"},
                {"e", "<cmd>wq!<cr>"},
                {"q", "<cmd>q!<cr>"},
                {"Q", "<cmd>qa!<cr>"},
                {"R", "<esc><cmd>Reload<cr>", options = {noremap = true}},
                {"f", "<cmd>lua require('telescope.builtin').find_files()<cr>"},
                {"s", "<cmd>lua require('telescope.builtin').live_grep()<cr>"},
                {
                    "t",
                    {
                        {"n", "<cmd>TestNearest<CR>"},
                        {"f", "<cmd>TestFile<CR>"}
                    }
                },
                {
                    "g",
                    {
                        {"s", "<cmd>Neogit<cr>"},
                        {"b", "<cmd>lua require('telescope.builtin').git_branches()<cr>"},
                        {"c", "<cmd>lua require('telescope.builtin').git_commits()<cr>"}
                    }
                },
                {
                    "v",
                    {
                        {"o", "<cmd>VimuxOpenRunner<CR>"},
                        {"c", "<cmd>VimuxCloseRunner<CR>"},
                        {"l", "<cmd>VimuxClearTerminalScreen<CR>"}
                    }
                },
                {
                    "d",
                    {
                        {"o", "<cmd>DiffviewOpen<cr>"},
                        {"c", "<cmd>DiffviewClose<cr>"}
                    }
                }
            }
        },
        {
            -- Figure out why not working
            "\\",
            {
                {"\\", "<cmd>NvimTreeToggle<cr>"},
                {"f", "<cmd>NvimTreeFindFile<cr>"},
                {"q", "<cmd>NvimTreeClose<cr>"}
            }
        },
        {
            "g",
            {
                "<c-",
                {
                    {"l>", '<cmd>lua require("swap-buffers").swap_buffers("l")<cr>'},
                    {"k>", '<cmd>lua require("swap-buffers").swap_buffers("k")<cr>'},
                    {"j>", '<cmd>lua require("swap-buffers").swap_buffers("j")<cr>'},
                    {"h>", '<cmd>lua require("swap-buffers").swap_buffers("h")<cr>'}
                }
            }
        },
        {
            "<c-",
            {
                {"e>", "3<c-e>"},
                {"y>", "3<c-y>"},
                {"h>", "<cmd>TmuxNavigateLeft<CR>"},
                {"j>", "<cmd>TmuxNavigateDown<CR>"},
                {"k>", "<cmd>TmuxNavigateUp<CR>"},
                {"l>", "<cmd>TmuxNavigateRight<CR>"},
                {"w>V<c-w>v", "<cmd>term<cr>"},
                {"w>ts <c-w>s", "<cmd>term<cr."}
            }
        },
        {"<space>", "<cmd>silent noh <Bar>echo<cr>:syn sync fromstart<cr>"},
        {"<bs>", "<c-^>"},
        {'"', '<cmd>lua require("telescope.builtin").registers()<cr>'},
        {"^", "g^"},
        {"0", "g0"},
        {"$", "g$"},
        {"n", "n<cmd>Beacon<CR>"},
        {"N", "N<cmd>Beacon<CR>"},
        {"*", "*<cmd>Beacon<CR>"},
        {"#", "#<cmd>Beacon<CR>"},
        options = {noremap = true, silent = true}
    },
    {
        mode = "i",
        {
            {"<Tab>", "v:lua.tab_complete()", options = {expr = true}},
            {"<S-Tab>", "v:lua.s_tab_complete()", options = {expr = true}},
            {"<cr>", 'compe#confirm("<cr>")', options = {expr = true}},
            {"<c-r>", '<cmd>lua require("telescope.builtin").registers()<cr>'}
        }
    },
    {
        mode = "v",
        {
            {"<", "<gv"},
            {">", ">gv"}
        }
    },
    {
        mode = "s",
        {
            {"<Tab>", "v:lua.tab_complete()", options = {expr = true}},
            {"<S-Tab>", "v:lua.s_tab_complete()", options = {expr = true}}
        }
    },
    {
        mode = "c",
        {
            {"<c-a>", "<home>"},
            {"<c-e>", "<end>"}
        }
    },
    {
        mode = "t",
        {
            {"<c-h>", "<-\\><c-n><c-w><c-h>"},
            {"<c-j>", "<-\\><c-n><c-w><c-j>l"},
            {"<c-k>", "<-\\><c-n><c-w><c-k>l"},
            {"<c-l>", "<-\\><c-n><c-w><c-l>l"}
        }
    }
}

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
