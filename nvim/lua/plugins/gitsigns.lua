local signs = require("gitsigns")
local M = {}

function M.setup()
    signs.setup({
        current_line_blame = true,
        keymaps = {
            ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
            ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },
            ["n <leader>hs"] = "<cmd>lua require(\"gitsigns\").stage_hunk()<CR>",
            ["v <leader>hs"] = "<cmd>lua require(\"gitsigns\").stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>",
            ["n <leader>hu"] = "<cmd>lua require(\"gitsigns\").undo_stage_hunk()<CR>",
            ["v <leader>hu"] = "<cmd>lua require(\"gitsigns\").undo_stage_hunk()<CR>",
            ["n <leader>hr"] = "<cmd>lua require\"gitsigns\".reset_hunk()<CR>",
            ["v <leader>hr"] = "<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>",
        },
    })
end

return M
