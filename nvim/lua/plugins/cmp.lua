local cmp = require("cmp")
local luasnip = require("luasnip")
local M = {}

function M.setup()
    vim.o.completeopt = "menuone,noselect"

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = {
            ["<c-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
            ["<c-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
            ["<c-d>"] = cmp.mapping.scroll_docs(-4),
            ["<c-f>"] = cmp.mapping.scroll_docs(4),
            ["<c-space>"] = cmp.mapping.complete(),
            ["<c-e>"] = cmp.mapping.close(),
            ["<cr>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
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
            end
        },
        sources = {
            {name = "buffer"},
            {name = "emoji"},
            {name = "latex_symbols"},
            {name = "luasnip"},
            {name = "nvim_lsp"},
            {name = "nvim_lua"},
            {name = "path"},
            {name = "spell"},
            {name = "tmux"},
            {name = "treesitter"}
        }
    }
end

return M
