local M = {}

function M.setup()
    vim.g.catppuccin_flavour = "frappe"
    require("catppuccin").setup()
end

function M.set_colorscheme()
    vim.cmd("colorscheme catppuccin")
end

return M
