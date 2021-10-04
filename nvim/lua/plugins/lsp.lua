local nvim_lsp = require("lspconfig")
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

local default_on_attach = function(client, bufnr)
    local nest = require("nest")
    local kind = require("lspkind")
    local saga = require("lspsaga")

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    signature.on_attach(signature_config, bufnr)

    -- saga
    saga.init_lsp_saga(
        {
            error_sign = "",
            warn_sign = "",
            hint_sign = "",
            infor_sign = "",
            border_style = "round"
        }
    )

    -- lspkind
    kind.init()

    -- Mappings.
    nest.applyKeymaps {
        buffer = true,
        options = {noremap = true, silent = true},
        {
            {
                "g",
                {
                    {"d", "<cmd>lua vim.lsp.buf.definition()<CR>"},
                    {"r", "<cmd>lua require('lspsaga.rename').rename()<CR>"},
                    {"R", "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>"},
                    {"a", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>"}
                }
            },
            {"K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>"},
            {"]d", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>"},
            {"[d", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>"},
            {"<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"},
            {"<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"}
        },
        {
            mode = "v",
            {"ga", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>"}
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

local function setup_lsp(lsp, settings)
    nvim_lsp[lsp].setup({on_attach = on_attach, capabilities = configure_capabilities(), settings = settings or {}})
end

local function setup_all_servers(servers)
    local pyright_settings = {
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                autoImportCompletions = true
            }
        }
    }

    -- TODO: Figure a way of compacting this
    setup_lsp("pyright", pyright_settings)
end

M.setup_lsp = function()
    disable_virtual_text()

    setup_all_servers(
        {
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
    )
end

-- TODO:
-- Inspiration for autoformatters and stuff like that:
-- https://github.com/ngtinsmith/dotfiles/blob/b78bf3115d746d037c814ce6767b4c6ba38021c5/.vimrc#L558

return M
