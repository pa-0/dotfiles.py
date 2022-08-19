local M = {}

local function on_attach(_client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gl", vim.diagnostic.setloclist, opts)

    vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        group = "LspFormatting",
        callback = function()
            vim.lsp.buf.format({
                timeout_ms = 2000,
                filter = function(clients)
                    return vim.tbl_filter(function(client)
                        return pcall(function(_client)
                            return _client.config.settings.autoFixOnSave or false
                        end, client) or false
                    end, clients)
                end,
            })
        end,
    })
end

local function register_null_ls_sources()
    local null_ls = require("null-ls")
    local sources = {
        null_ls.builtins.diagnostics.flake8.with({
            command = vim.fn.expand("$HOME/.local/bin/flake8"),
            extra_args = { "--config", vim.fn.expand("$DOTFILES/python/flake8") },
        }),
        null_ls.builtins.diagnostics.mypy.with({
            command = vim.fn.expand("$HOME/.local/bin/mypy"),
            extra_args = { "--config-file", vim.fn.expand("$DOTFILES/python/mypy.ini") },
        }),
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.selene.with({
            extra_args = { "--config", vim.fn.expand("$DOTFILES/selene.toml") },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt.with({ filetypes = { "sh", "zsh" } }),
        null_ls.builtins.diagnostics.yamllint.with({
            extra_args = { "-c", vim.fn.expand("$DOTFILES/python/yamllint.yml") },
        }),
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier_d_slim,
        null_ls.builtins.formatting.djhtml,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.trim_newlines,
        null_ls.builtins.formatting.trim_whitespace,
    }

    null_ls.setup({
        sources = sources,
        on_attach = on_attach,
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = false,
                virtual_text = false,
                signs = true,
                update_in_insert = false,
            }),
        },
    })
end

function M.setup()
    register_null_ls_sources()
end

return M
