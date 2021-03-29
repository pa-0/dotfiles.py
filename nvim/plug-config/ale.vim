let g:airline#extensions#ale#enabled = 1

let g:ale_echo_msg_format = '[%linter%]: %s'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_python_flake8_use_global = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'css': ['stylelint'],
\   'go': ['golint'],
\   'json': ['jq'],
\   'lua': ['luac'],
\   'python': ['flake8helled', 'flake8', 'vulture', 'mypy'],
\   'rust': ['rls'],
\   'sh': ['shellcheck'],
\   'sql': ['sqlint'],
\   'tex': ['lacheck'],
\   'vim': ['vint'],
\   'yaml': ['yamllint']
\ }

let g:ale_set_loclist = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   '*': ['trim_whitespace', 'remove_trailing_lines'],
\   'css': ['prettier'],
\   'go': ['gofmt'],
\   'javascript': ['prettier'],
\   'json': ['jq'],
\   'lua': ['luafmt'],
\   'markdown': ['prettier'],
\   'python': ['isort', 'black'],
\   'rust': ['rustfmt'],
\   'yaml': ['prettier']
\ }

let g:ale_python_black_options = '--config $DOTFILES/python/black-config.toml'
let g:ale_python_flake8_options = '--config $DOTFILES/python/flake8 --max-line-length $PYTHON_LINE_LENGTH'
let g:ale_python_isort_options = ''
let g:ale_python_mypy_options = '--config-file $DOTFILES/python/mypy.ini'
let g:ale_python_vulture_options = '--min-confidence 100'

nnoremap <silent> ]l :ALENextWrap<CR>
nnoremap <silent> [l :ALEPreviousWrap<CR>
