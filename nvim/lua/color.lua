local M = {}

function M.setup()
    require("tokyonight").setup({
        style = "night",
        dim_inactive = true,
    })
end

function M.set_colorscheme()
    vim.cmd("colorscheme tokyonight")
end

return M
