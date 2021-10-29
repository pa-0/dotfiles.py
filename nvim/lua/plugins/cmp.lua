local M = {}

function M.setup()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
        completion = {
            keyword_length = 2,
        },
        formatting = {
            format = lspkind.cmp_format(),
        },
        mapping = {
            ["<c-c>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "treesitter" },
            { name = "buffer" },
            { name = "tmux" },
            { name = "path" },
            { name = "spell" },
            { name = "emoji" },
            { name = "latex_symbols" },
            { name = "nvim_lua" },
            { name = "luasnip" },
        },
    })
end

return M
