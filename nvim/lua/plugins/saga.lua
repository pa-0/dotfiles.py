require("lspsaga").init_lsp_saga()

local opts = {noremap = true, silent = true}
local nvim_set_keymap = vim.api.nvim_set_keymap

nvim_set_keymap("n", "gd", "<cmd> lua require('lspsaga.provider').lsp_finder()<CR>)", opts)
nvim_set_keymap("n", "gD", "<cmd> lua require('lspsaga.provider').preview_definition()<CR>)", opts)
nvim_set_keymap("n", "ga", "<cmd> lua require('lspsaga.codeaction').code_action()<CR>)", opts)
nvim_set_keymap("v", "ga", ":<C-U> lua require('lspsaga.codeaction').range_code_action()<CR>)", opts)
nvim_set_keymap("n", "K", "<cmd> lua require('lspsaga.hover').render_hover_doc()<CR>)", opts)
nvim_set_keymap("n", "<c-f>", "<cmd> lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>)", opts)
nvim_set_keymap("n", "<c-b>", "<cmd> lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>)", opts)
nvim_set_keymap("n", "<leader>k", "<cmd> lua require('lspsaga.signaturehelp').signature_help()<CR>)", opts)
nvim_set_keymap("n", "gr", "<cmd> lua require('lspsaga.rename').rename()<CR>)", opts)
nvim_set_keymap("n", "[d", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", opts)
nvim_set_keymap("n", "]d", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", opts)
