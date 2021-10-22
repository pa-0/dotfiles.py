local M = {}

function M.setup()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    vim.o.completeopt = "menu,menuone,noselect"

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        completion = {
            keyword_length = 2,
        },
        formatting = {
            format = lspkind.cmp_format(),
        },
        mapping = {
            ["<c-d>"] = cmp.mapping.scroll_docs(-4),
            ["<c-f>"] = cmp.mapping.scroll_docs(4),
            ["<c-space>"] = cmp.mapping.complete(),
            ["<c-e>"] = cmp.mapping.close(),
            ["<cr>"] = cmp.mapping.confirm({ select = true }),
            ["<tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            ["<s-tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
        },
        sources = {
            { name = "buffer" },
            { name = "emoji" },
            { name = "latex_symbols" },
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "spell" },
            { name = "tmux" },
            { name = "treesitter" },
        },
    })
end

return M
