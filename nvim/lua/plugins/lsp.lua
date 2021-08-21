local nvim_lsp = require("lspconfig")

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

local servers = {
    "bashls",
    "cssls",
    "gopls",
    "html",
    "pyright",
    "rust_analyzer",
    "tailwindcss",
    "texlab",
    "tsserver",
    "vuels"
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {capabilities = capabilities}
end

-- Inspiration for autoformatters and stuff like that:
-- https://github.com/ngtinsmith/dotfiles/blob/b78bf3115d746d037c814ce6767b4c6ba38021c5/.vimrc#L558
