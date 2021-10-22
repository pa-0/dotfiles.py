local M = {}
local g = vim.g

function M.setup()
    g.ale_disable_lsp = 1
    g.ale_sign_column_always = 1

    g.ale_echo_msg_format = "[%linter%]: %s"

    g.ale_lint_on_text_changed = "never"
    g.ale_lint_on_insert_leave = 0
    g.ale_python_flake8_use_global = 1

    g.ale_set_loclist = 1
    g.ale_fix_on_save = 1

    g.ale_linters_explicit = 1

    g.ale_linters = {
        python = { "mypy" },
        tex = { "lacheck" },
    }

    g.ale_fixers = {
        python = { "autoflake" },
    }

    g.ale_python_autoflake_options = "--remove-all-unused-imports --expand-star-imports --remove-duplicate-keys"
    g.ale_python_mypy_options = "--config-file $DOTFILES/python/mypy.ini --cache-dir=$HOME/.cache/mypy/"
end

return M
