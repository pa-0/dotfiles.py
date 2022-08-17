local M = {}

function M.setup()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local snippets = require("luasnip.loaders.from_vscode")
    local lspkind = require("lspkind")

    snippets.load()

    cmp.setup({
        completion = {
            completeopt = "menu,menuone,noinsert",
            keyword_length = 1,
        },
        view = {
            entries = {
                name = "custom",
                selection_order = "near_cursor",
            },
        },
        formatting = {
            format = function(entry, vim_item)
                local kind = lspkind.cmp_format({
                    mode = "symbol_text",
                    max_width = 50,
                })
                kind = kind(entry, vim_item)
                local strings = vim.split(kind.kind, "%s", { trimempty = true })
                kind.kind = " " .. strings[1] .. " "
                kind.menu = "    (" .. strings[2] .. ")"

                return kind
            end,
        },
        mapping = {
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
            ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            ["<c-c>"] = cmp.mapping.close(),
            ["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
            ["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lsp_signature_help" },
            { name = "luasnip" },
            { name = "path" },
            { name = "buffer" },
            { name = "emoji" },
        },
    })
end

return M
