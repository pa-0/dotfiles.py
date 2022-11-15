local M = {}

function M.setup()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
        view = {
            entries = {
                name = "custom",
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
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<c-c>"] = cmp.mapping.close(),
            ["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
            ["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lsp_signature_help" },
            { name = "buffer" },
            { name = "path" },
            { name = "emoji" },
        },
    })
end

return M
