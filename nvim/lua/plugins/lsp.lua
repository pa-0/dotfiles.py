local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    require("lsp_signature").on_attach {}

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "<leader>d", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<leader>s", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<leader>l", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    -- :help lsp
    -- vim.api.nvim_set_keymap("n", "1gD", [[<cmd>lua  vim.lsp.buf.type_definition()<cr>]], opts)
    -- vim.api.nvim_set_keymap("n", "g0", [[<cmd>lua vim.lsp.buf.document_symbol()<cr>]], opts)
    -- vim.api.nvim_set_keymap("n", "gW", [[<cmd>lua vim.lsp.buf.workspace_symbol()<cr>]], opts)
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- Config available at https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local servers = {
    "bashls",
    "cssls",
    "dockerls",
    "gopls",
    "html",
    "pyls",
    "rust_analyzer",
    "texlab",
    "tsserver",
    "vls"
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {on_attach = on_attach}
end

-- Inspiration for autoformatters and stuff like that:
-- https://github.com/ngtinsmith/dotfiles/blob/b78bf3115d746d037c814ce6767b4c6ba38021c5/.vimrc#L558
