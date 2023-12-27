local function on_attach(_client, bufnr)
    vim.keymap.set("n", "gl", vim.diagnostic.setloclist, { noremap = true, silent = true, buffer = bufnr })

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

local function setup()
    local null_ls = require("null-ls")
    local sources = {
        null_ls.builtins.formatting.reorder_python_imports,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.djhtml,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt.with({ filetypes = { "sh", "zsh" } }),
        null_ls.builtins.formatting.prettier.with({ disabled_filetypes = { "html" } }),
        null_ls.builtins.formatting.trim_newlines,
        null_ls.builtins.formatting.trim_whitespace,
        null_ls.builtins.diagnostics.flake8.with({
            command = vim.fn.expand("$HOME/.local/bin/flake8"),
            extra_args = { "--config", vim.fn.expand("$DOTFILES/python/flake8") },
        }),
        null_ls.builtins.diagnostics.mypy.with({
            command = vim.fn.expand("$HOME/.local/bin/mypy"),
            extra_args = { "--config-file", vim.fn.expand("$DOTFILES/python/mypy.ini") },
        }),
        null_ls.builtins.diagnostics.selene.with({
            extra_args = { "--config", vim.fn.expand("$DOTFILES/selene.toml") },
        }),
        null_ls.builtins.diagnostics.yamllint.with({
            extra_args = { "-c", vim.fn.expand("$DOTFILES/python/yamllint.yml") },
        }),
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.shellcheck,
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

return {
    "nvimtools/none-ls.nvim",
    name = "none_ls",
    config = function()
        setup()
    end,
    lazy = true,
}
