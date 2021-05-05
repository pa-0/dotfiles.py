vim.g.mapleader = ","

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<leader>w", [[:w<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>W", [[:wqa!<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>e", [[:wq!<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>q", [[:q!<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>Q", [[:qa!<CR>]], opts)

vim.api.nvim_set_keymap("n", "<leader>R", [[:source $MYVIMRC<CR>]], {noremap = true})
vim.api.nvim_set_keymap("n", "<space>", [[:noh<CR>]], opts)

vim.api.nvim_set_keymap("n", "^", [[g^]], opts)
vim.api.nvim_set_keymap("n", "0", [[g0]], opts)
vim.api.nvim_set_keymap("n", "$", [[g$]], opts)

vim.api.nvim_set_keymap("n", "<c-e>", [[3<c-e>]], opts)
vim.api.nvim_set_keymap("n", "<c-y>", [[3<c-y>]], opts)

vim.api.nvim_set_keymap("n", "<BS>", [[<c-^>]], opts)

vim.api.nvim_set_keymap("n", "<", [[<gv]], opts)
vim.api.nvim_set_keymap("n", ">", [[>gv]], opts)

vim.api.nvim_set_keymap("n", "<c-l>", [[<c-w>l]], opts)
vim.api.nvim_set_keymap("n", "<c-k>", [[<c-w>k]], opts)
vim.api.nvim_set_keymap("n", "<c-j>", [[<c-w>j]], opts)
vim.api.nvim_set_keymap("n", "<c-h>", [[<c-w>h]], opts)

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

vim.api.nvim_set_keymap("n", "<c-w>tV<c-w>v", [[:term<CR>]], opts)
vim.api.nvim_set_keymap("n", "<c-w>ts <c-w>s", [[:term<CR>]], opts)

vim.api.nvim_set_keymap("t", "<c-h>", [[<-\><c-n><c-w><c-h>]], opts)
vim.api.nvim_set_keymap("t", "<c-j>", [[<-\><c-n><c-w><c-j>l]], opts)
vim.api.nvim_set_keymap("t", "<c-k>", [[<-\><c-n><c-w><c-k>l]], opts)
vim.api.nvim_set_keymap("t", "<c-l>", [[<-\><c-n><c-w><c-l>l]], opts)

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})

vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
