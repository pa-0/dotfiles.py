return {
    "tamton-aquib/duck.nvim",
    config = function()
        vim.cmd("command! DuckHatch lua require('duck').hatch()")
        vim.cmd("command! DuckCook lua require('duck').cook()")
    end,
    cmd = { "DuckHatch", "DuckCook" },
}
