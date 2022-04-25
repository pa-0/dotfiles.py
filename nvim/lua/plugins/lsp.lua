local lspconfig = require("lspconfig")

local M = {}

local function on_attach(client, bufnr)
    local nest = require("nest")

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    client.resolved_capabilities.document_formatting = false

    -- Mappings.
    nest.applyKeymaps({
        buffer = true,
        options = { noremap = true, silent = true },
        {
            {
                "g",
                {
                    { "d", "<cmd>lua vim.lsp.buf.definition()<CR>" },
                    { "r", "<cmd>lua vim.lsp.buf.rename()<CR>" },
                    { "R", "<cmd>lua vim.lsp.buf.references()<CR>" },
                    { "a", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
                    { "l", "<cmd>lua vim.diagnostic.setloclist()<CR>" },
                },
            },
            { "K", "<cmd>Lspsaga hover_doc<CR>" },
            { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
            { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
        },
    })
end

local function disable_virtual_text()
    vim.diagnostic.config({ virtual_text = false })
end

local function configure_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.completion.completionItem = {
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = {
            valueSet = { 1 },
        },
        resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        },
    }

    return capabilities
end

local function setup_lsp(lsp_name, settings)
    lspconfig[lsp_name].setup({
        on_attach = on_attach,
        capabilities = configure_capabilities(),
        settings = settings or {},
    })
end

local function setup_all_servers(servers)
    for _, lsp in ipairs(servers) do
        setup_lsp(lsp)
    end
end

function M.setup_lsp()
    require("plugins.null_ls").setup()

    disable_virtual_text()
    setup_all_servers({
        "bashls",
        "cssls",
        "denols",
        "gopls",
        "html",
        "pylsp",
        "rust_analyzer",
        "tailwindcss",
        "texlab",
        "tsserver",
        "vuels",
    })
end

return M
