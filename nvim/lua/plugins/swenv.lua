return {
    "AckslD/swenv.nvim",
    config = function()
        require("swenv").setup({
            venvs_path = vim.fn.expand("$HOME/.local/share/virtualenvs"),
            post_set_venv = function(_)
                vim.cmd("LspRestart")
            end,
        })
        vim.cmd("command! Virtualenv lua require('swenv.api').pick_venv()")
    end,
    dependencies = {
        "stevearc/dressing.nvim",
    },
    event = "BufRead",
    ft = "python",
}
