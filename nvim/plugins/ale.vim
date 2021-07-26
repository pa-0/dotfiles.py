let g:ale_echo_msg_format = '[%linter%]: %s'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_python_flake8_use_global = 1

let g:ale_set_loclist = 1
let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'css': ['stylelint', 'eslint'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'json': ['prettier'],
\   'lua': ['luac'],
\   'python': ['flake8', 'vulture', 'mypy'],
\   'scss': ['eslint'],
\   'sh': ['shellcheck'],
\   'sql': ['sqlint'],
\   'tex': ['lacheck'],
\   'typescript': ['lacheck'],
\   'vim': ['vint'],
\   'yaml': ['yamllint']
\ }

let g:ale_fixers = {
\   '*': ['trim_whitespace', 'remove_trailing_lines'],
\   'css': ['prettier'],
\   'go': ['gofmt'],
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'json': ['jq'],
\   'lua': ['luafmt'],
\   'python': ['isort', 'black'],
\   'rust': ['rustfmt'],
\   'scss': ['prettier'],
\   'svg': ['prettier'],
\   'typescript': ['lacheck'],
\   'vue': ['prettier'],
\   'yaml': ['prettier']
\ }

let g:ale_python_black_options = '--config $DOTFILES/python/black-config.toml'
let g:ale_python_flake8_options = '--config $DOTFILES/python/flake8 --max-line-length $PYTHON_LINE_LENGTH'
let g:ale_python_isort_options = ''
let g:ale_python_mypy_options = '--config-file $DOTFILES/python/mypy.ini --cache-dir=$HOME/.cache/mypy/'
let g:ale_python_vulture_options = '--min-confidence 100'
let g:ale_yaml_yamllint_options = '-c $DOTFILES/python/yamllint.yml'
