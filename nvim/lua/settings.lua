vim.cmd [[
    abbr slef self
    abbr cosntants constants
    abbr unkown unknown
    abbr clas class
    abbr krags kwargs
    abbr __clas__ __class__
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qa! qa!
    cnoreabbrev Wqa! wqa!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev Wqa wqa
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
]]

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
vim.wo.cursorline = true
vim.o.mouse = "a"
vim.nofoldenable = true
vim.o.paste = false
vim.o.showmode = false
vim.o.swapfile = false
vim.o.wrap = false
vim.o.scrolloff = 3
vim.o.signcolumn = "yes"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.timeoutlen = 400
vim.o.updatetime = 100
vim.o.termguicolors = true

vim.o.expandtab = true
vim.o.shiftround = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.cmd [[
augroup ConfigGroup
    autocmd!
    autocmd FocusLost * silent! wa!
    autocmd BufRead,BufNewFile *.har set filetype=json
    autocmd FileType yaml,javascript,json,html,jinja.html,toml,vue setlocal sw=2 ts=2 sts=2
    autocmd Filetype gitcommit,md,tex,txt setlocal spell
augroup END
]]

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.lazyredraw = false

vim.cmd [[
    set list listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮ showbreak=↪
]]
