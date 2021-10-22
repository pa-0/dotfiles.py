local null_ls = require("null-ls")

local M = {}

local function register_null_ls_sources()
    local sources = {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.flake8.with({
            extra_args = {
                "--config",
                vim.fn.expand("$DOTFILES/python/flake8", "--max-line-length", vim.fn.expand("$PYTHON_LINE_LENGTH")),
            },
        }),
        null_ls.builtins.diagnostics.shellcheck.with({ filetypes = { "sh", "zsh" } }),
        null_ls.builtins.diagnostics.selene.with({
            extra_args = { "--config", vim.fn.expand("$DOTFILES/selene.toml") },
        }),
        null_ls.builtins.diagnostics.yamllint.with({
            extra_args = { "-c", vim.fn.expand("$DOTFILES/python/yamllint.yml") },
        }),
        null_ls.builtins.formatting.black.with({
            extra_args = { "--config", vim.fn.expand("$DOTFILES/python/black-config.toml") },
        }),
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.shfmt.with({ filetypes = { "sh", "zsh" } }),
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.trim_newlines,
        null_ls.builtins.formatting.trim_whitespace,
    }

    null_ls.config({ sources = sources })
    null_ls.setup()
end

function M.setup()
    register_null_ls_sources()
end

return M
