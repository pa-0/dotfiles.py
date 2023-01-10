--  _   _         __     ___
-- | \ | | ___  __\ \   / (_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
-- | |\  |  __/ (_) \ V / | | | | | | |
-- |_| \_|\___|\___/ \_/  |_|_| |_| |_|
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("builtin")
require("keymaps")
require("abbrevs")
require("autocmd")
require("commands")
require("lazy").setup("plugins")
vim.cmd("colorscheme tokyonight")
