return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            javascript = { "eslint_d" },
            lua = { "selene" },
            python = { "flake8", "mypy" },
            sh = { "shellcheck" },
            yaml = { "yamllint" },
        }
        vim.keymap.set("n", "gl", vim.diagnostic.setloclist, { noremap = true, silent = true })
        vim.cmd("command! Lint lua require('lint').try_lint()")
    end,
}
