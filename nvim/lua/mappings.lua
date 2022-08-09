local set_keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

set_keymap("n", "<space>", "<cmd>silent noh <Bar>echo<cr>:syn sync fromstart<cr>", opts)
set_keymap("n", "<bs>", "<c-^>", opts)
set_keymap("n", "^", "g^", opts)
set_keymap("n", "0", "g0", opts)
set_keymap("n", "$", "g$", opts)
set_keymap("n", "<c-e>", "3<c-e>", opts)
set_keymap("n", "<c-y>", "3<c-y>", opts)

set_keymap("v", ">", ">gv", opts)
set_keymap("v", "<", "<gv", opts)

set_keymap("c", "<c-a>", "<home>", opts)
set_keymap("c", "<c-e>", "<end>", opts)

set_keymap("t", "<c-h>", "<-\\><c-n><c-w><c-h>", opts)
set_keymap("t", "<c-j>", "<-\\><c-n><c-w><c-j>l", opts)
set_keymap("t", "<c-k>", "<-\\><c-n><c-w><c-k>l", opts)
set_keymap("t", "<c-l>", "<-\\><c-n><c-w><c-l>l", opts)

set_keymap("n", "\\\\", "<cmd>NvimTreeToggle<CR>", opts)
set_keymap("n", "\\f", "<cmd>NvimTreeFindFile<CR>", opts)
set_keymap("n", "\\q", "<cmd>NvimTreeClose<CR>", opts)

set_keymap("n", "<leader>do", "<cmd>DiffviewOpen<CR>", opts)
set_keymap("n", "<leader>dc", "<cmd>DiffviewClose<CR>", opts)
set_keymap("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>", opts)
