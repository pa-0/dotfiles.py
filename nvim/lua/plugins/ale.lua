local g = vim.g

g.ale_echo_msg_format = "[%linter%]: %s"

g.ale_lint_on_text_changed = "never"
g.ale_lint_on_insert_leave = 0
g.ale_python_flake8_use_global = 1

g.ale_set_loclist = 1
g.ale_fix_on_save = 1

g.ale_linters_explicit = 1

g.ale_linters = {
    css = {"stylelint", "eslint"},
    javascript = {"eslint"},
    javascriptreact = {"eslint"},
    lua = {"luac"},
    python = {"flake8", "mypy"},
    scss = {"eslint"},
    sh = {"shellcheck"},
    tex = {"lacheck"},
    yaml = {"yamllint"}
}

g.ale_fixers = {
    ["*"] = {"trim_whitespace", "remove_trailing_lines"},
    css = {"prettier"},
    go = {"gofmt"},
    javascript = {"prettier"},
    javascriptreact = {"prettier"},
    json = {"jq"},
    lua = {"luafmt"},
    python = {"isort", "black"},
    rust = {"rustfmt"},
    scss = {"prettier"},
    vue = {"prettier"},
    yaml = {"prettier"}
}

g.ale_python_black_options = ""
g.ale_python_flake8_options = "--config $DOTFILES/python/flake8 --max-line-length $PYTHON_LINE_LENGTH"
g.ale_python_isort_options = ""
g.ale_python_mypy_options = "--config-file $DOTFILES/python/mypy.ini --cache-dir=$HOME/.cache/mypy/"
g.ale_python_vulture_options = "--min-confidence 100"
g.ale_yaml_yamllint_options = "-c $DOTFILES/python/yamllint.yml"
