local set_keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

set_keymap("n", "<leader><space>", "<cmd>silent noh <Bar>echo<cr>:syn sync fromstart<cr>", opts)
set_keymap("n", "<bs>", "<c-^>", opts)
set_keymap("n", "^", "g^", opts)
set_keymap("n", "0", "g0", opts)
set_keymap("n", "$", "g$", opts)
set_keymap("n", "<c-e>", "3<c-e>", opts)
set_keymap("n", "<c-y>", "3<c-y>", opts)

set_keymap("n", "<c-d>", "<c-d>zz", opts)
set_keymap("n", "<c-u>", "<c-u>zz", opts)

set_keymap("n", "<c-o>", "<c-o>zz", opts)
set_keymap("n", "<c-i>", "<c-i>zz", opts)

set_keymap("n", "n", "nzzzv", opts)
set_keymap("n", "N", "Nzzzv", opts)

set_keymap("n", "]c", function()
    require("gitsigns").next_hunk()
end, opts)

set_keymap("n", "[c", function()
    require("gitsigns").prev_hunk()
end, opts)

set_keymap("n", "<leader>l", "<cmd>NvimTreeToggle<CR>", opts)
set_keymap("n", "<leader>lf", "<cmd>NvimTreeFindFile<CR>", opts)
set_keymap("n", "<leader>lq", "<cmd>NvimTreeClose<CR>", opts)

set_keymap("n", "<leader>do", "<cmd>DiffviewOpen<CR>", opts)
set_keymap("n", "<leader>dq", "<cmd>DiffviewClose<CR>", opts)
set_keymap("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>", opts)

set_keymap("n", "<leader>tn", "<cmd>TestNearest<CR>", opts)
set_keymap("n", "<leader>tf", "<cmd>TestFile<CR>", opts)
set_keymap("n", "<leader>ts", "<cmd>TestSuite<CR>", opts)

set_keymap("n", "<c-g><c-e>", "<cmd>Telescope git_files<CR>", opts)
set_keymap("n", "<c-g><c-s>", "<cmd>Telescope live_grep<CR>", opts)
set_keymap("n", "<c-g><c-b>", "<cmd>Telescope buffers<CR>", opts)
set_keymap("n", "gl", "<cmd>Telescope diagnostics<CR>", opts)

set_keymap("v", ">", ">gv", opts)
set_keymap("v", "<", "<gv", opts)

set_keymap("c", "<c-a>", "<home>", opts)
set_keymap("c", "<c-e>", "<end>", opts)

set_keymap("t", "<c-h>", "<-\\><c-n><c-w><c-h>", opts)
set_keymap("t", "<c-j>", "<-\\><c-n><c-w><c-j>l", opts)
