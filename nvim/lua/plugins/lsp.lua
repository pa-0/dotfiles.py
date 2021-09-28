local M = {}

local disable_virtual_text = function()
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            underline = true,
            virtual_text = false,
            signs = true,
            update_in_insert = false
        }
    )
end

local on_attach = function(client, bufnr)
    local nest = require("nest")

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    signature.on_attach(signature_config, bufnr)

    -- lighbulb
    vim.cmd [[
        autocmd CursorHold,CursorHoldI * lua require('plugins.lsp').update_lightbulb()
    ]]

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
                    {"a", "<cmd>CodeActionMenu<CR>"},
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

local configure_capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits"
        }
    }

    return capabilities
end

M.setup_lsp = function()
    local nvim_lsp = require("lspconfig")

    disable_virtual_text()

    nvim_lsp.pyright.setup(
        {
            on_attach = on_attach,
            capabilities = configure_capabilities(),
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
        nvim_lsp[lsp].setup({on_attach = on_attach, capabilities = configure_capabilities()})
    end
end

return M
