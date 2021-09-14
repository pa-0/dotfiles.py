local nvim_lsp = require("lspconfig")
local signature = require("lsp_signature")
local nest = require("nest")

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

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    signature.on_attach(signature_config, bufnr)

    -- Mappings.
    nest.applyKeymaps {
        buffer = true,
        options = {noremap = true, silent = true},
        {
            {
                "g",
                {
                    {"d", "<cmd>lua vim.lsp.buf.definition()<CR>"},
                    {"y", "<cmd>lua vim.lsp.buf.type_definition()<CR>"},
                    {"D", "<cmd>lua vim.lsp.buf.declaration()<CR>"},
                    {"i", "<cmd>lua vim.lsp.buf.implementation()<CR>"},
                    {"r", "<cmd>lua vim.lsp.buf.rename()<CR>"},
                    {"R", "<cmd>lua vim.lsp.buf.references()<CR>"},
                    {"a", "<cmd>lua vim.lsp.buf.code_action()<CR>"},
                    {"0", "<cmd>lua vim.lsp.buf.document_symbol()<cr>"},
                    {"W", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>"}
                }
            },
            {"<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>"},
            {"[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"},
            {"]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"},
            {"K", "<cmd>lua vim.lsp.buf.hover()<CR>"}
        },
        {
            mode = "v",
            {"ga", ":<C-U>lua vim.lsp.buf.range_code_action()<CR>"}
        }
    }
end

nvim_lsp.pyright.setup(
    {
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
)

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- Config available at https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local servers = {
    "bashls",
    "cssls",
    "denols",
    "gopls",
    "html",
    "rust_analyzer",
    "tailwindcss",
    "texlab",
    "tsserver",
    "vuels"
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({on_attach = on_attach, capabilities = capabilities})
end

-- Inspiration for autoformatters and stuff like that:
-- https://github.com/ngtinsmith/dotfiles/blob/b78bf3115d746d037c814ce6767b4c6ba38021c5/.vimrc#L558
