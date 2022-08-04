local M = {}

function M.setup()
    vim.g["test#enabled_runner"] = { "python#pytest" }
    vim.g["test#strategy"] = "vimux"
    vim.g["test#python#runner"] = "pytest"
    vim.g["test#python#pytest#options"] = {
        nearest = "--color yes -lsxv",
        file = "--color yes --durations=10 -qk ''",
        suite = "--color yes --durations=10 -qk ''",
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<CR>", opts)
    vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<CR>", opts)
    vim.keymap.set("n", "<leader>ts", "<cmd>TestSuite<CR>", opts)
end

return M
