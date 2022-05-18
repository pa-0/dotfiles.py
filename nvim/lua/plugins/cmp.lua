local M = {}

function M.setup()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local snippets = require("luasnip.loaders.from_vscode")

    snippets.load()

    cmp.setup({
        completion = {
            completeopt = "menu,menuone,noinsert",
            keyword_length = 2,
        },
        mapping = {
            ["<c-c>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<c-space>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
            ["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
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

    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })

    cmp.setup.cmdline("/", {
        sources = {
            { name = "treesitter" },
            { name = "buffer" },
            { name = "tmux" },
        },
    })
end

return M
