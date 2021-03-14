" nvim-treesitter configuration
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = {"bash", "c", "html", "javascript", "json", "python", "regex", "rst", "rust", "toml", "yaml"},
"   highlight = {
"     enable = true,
"   },
"   highlight = {
"     enable = true,
"   },
"   indent = {
"     enable = true,
"   },
" }
" EOF

" " Set up folding
" set foldexpr=nvim_treesitter#foldexpr()
" set foldmethod=expr
