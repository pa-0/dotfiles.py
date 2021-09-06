local nvim_lsp = require("lspconfig")
local signature = require("lsp_signature")

-- Removes virtual text
-- To access diagnostic text saga does the trick
vim.lsp.diagnostic.set_virtual_text = function()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits"
    }
}

local signature_config = {
    use_lspsaga = true,
    max_width = 88
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    local opts = {noremap = true, silent = true}

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    signature.on_attach(signature_config, bufnr)

    -- Mappings.
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
    buf_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "ga", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
    buf_set_keymap("v", "ga", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
    buf_set_keymap("n", "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
    buf_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", opts)
    buf_set_keymap("n", "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    buf_set_keymap("n", "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
end

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                autoImportCompletions = true
            }
        }
    }
}

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- Config available at https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local servers = {
    "bashls",
    "cssls",
    "gopls",
    "html",
    "rust_analyzer",
    "tailwindcss",
    "texlab",
    "tsserver",
    "vuels"
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {on_attach = on_attach, capabilities = capabilities}
end

-- Inspiration for autoformatters and stuff like that:
-- https://github.com/ngtinsmith/dotfiles/blob/b78bf3115d746d037c814ce6767b4c6ba38021c5/.vimrc#L558
