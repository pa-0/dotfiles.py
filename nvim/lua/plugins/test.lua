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
end

return M
