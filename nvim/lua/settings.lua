local function set_options()
    vim.g.mapleader = ","

    vim.o.background = "dark"
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
    vim.o.pumheight = 15

    vim.o.expandtab = true
    vim.o.shiftround = true
    vim.o.smartindent = true
    vim.o.smarttab = true
    vim.o.shiftwidth = 4
    vim.o.softtabstop = 4
    vim.o.tabstop = 4

    vim.o.ignorecase = true
    vim.o.smartcase = true
    vim.o.hlsearch = true
    vim.o.incsearch = true
    vim.o.lazyredraw = false

    vim.opt.list = true
    vim.opt.listchars = {
        tab = "→ ",
        eol = "¬",
        trail = "⋅",
        extends = "❯",
        precedes = "❮",
    }

    vim.opt.showbreak = "↪"
end

local function set_abbrevs()
    vim.cmd([[
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
        cnoreabbrev E! e!
    ]])
end

local function disabled_built_in_plugins()
    -- Disable some in built plugins completely
    local disabled_built_ins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "remote_plugins",
        "rrhelper",
        "shada_plugin",
        "spellfile_plugin",
        "tar",
        "tarPlugin",
        "tutor_mode_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
    }
    for _, plugin in pairs(disabled_built_ins) do
        vim.g["loaded_" .. plugin] = 1
    end

    -- Deactivate unused providers
    vim.g.loaded_node_provider = 0
    vim.g.loaded_perl_provider = 0
    vim.g.loaded_python_provider = 0
    vim.g.loaded_ruby_provider = 0
end

disabled_built_in_plugins()
set_abbrevs()
set_options()
