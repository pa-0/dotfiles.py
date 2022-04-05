local M = {}

function M.setup()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local snippets = require("luasnip.loaders.from_vscode")
    local autopairs = require("nvim-autopairs.completion.cmp")

    snippets.load()

    cmp.setup({
        completion = {
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
        sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "treesitter" },
            { name = "nvim_lua" },
            { name = "spell" },
            { name = "emoji" },
            { name = "buffer" },
            { name = "tmux" },
            { name = "path" },
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

    cmp.event:on("confirm_done", autopairs.on_confirm_done({ map_char = { tex = { "" } } }))
end

return M
