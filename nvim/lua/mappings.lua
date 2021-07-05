vim.g.mapleader = ","

local remap = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}

-- Saving and quitting mappings
remap("n", "<leader>w", [[:w<CR>]], opts)
remap("n", "<leader>W", [[:wqa!<CR>]], opts)
remap("n", "<leader>e", [[:wq!<CR>]], opts)
remap("n", "<leader>q", [[:q!<CR>]], opts)
remap("n", "<leader>Q", [[:qa!<CR>]], opts)

remap("n", "<leader>R", "<esc>:Reload<CR>", {noremap = true})
remap("n", "<space>", [[:silent noh <Bar>echo<cr>:syn sync fromstart<cr>]], opts)

remap("n", "^", [[g^]], opts)
remap("n", "0", [[g0]], opts)
remap("n", "$", [[g$]], opts)

remap("n", "<c-e>", [[3<c-e>]], opts)
remap("n", "<c-y>", [[3<c-y>]], opts)

-- Jump to the last buffer
remap("n", "<BS>", [[<c-^>]], opts)

-- Indent and dont de-select
remap("v", "<<", [[<gv]], opts)
remap("v", ">>", [[>gv]], opts)

-- Jump between splits
remap("n", "<c-l>", [[<c-w>l]], opts)
remap("n", "<c-k>", [[<c-w>k]], opts)
remap("n", "<c-j>", [[<c-w>j]], opts)
remap("n", "<c-h>", [[<c-w>h]], opts)

-- Beginning and end of line in `:` command mode
remap("c", "<C-a>", "<home>", {})
remap("c", "<C-e>", "<end>", {})
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

-- Make the terminal feel "normal"
remap("n", "<c-w>tV<c-w>v", [[:term<CR>]], opts)
remap("n", "<c-w>ts <c-w>s", [[:term<CR>]], opts)

remap("t", "<c-h>", [[<-\><c-n><c-w><c-h>]], opts)
remap("t", "<c-j>", [[<-\><c-n><c-w><c-j>l]], opts)
remap("t", "<c-k>", [[<-\><c-n><c-w><c-k>l]], opts)
remap("t", "<c-l>", [[<-\><c-n><c-w><c-l>l]], opts)

-- Completion nonsense
remap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
remap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})

remap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
remap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
