local function reorder_python_imports()
    local util = require("formatter.util")
    return {
        exe = "reorder-python-imports",
        args = {
            util.escape_path(util.get_current_buffer_file_path()),
        },
        stdin = true,
    }
end

local function djhtml()
    local util = require("formatter.util")
    return {
        exe = "djhtml",
        args = {
            util.escape_path(util.get_current_buffer_file_path()),
        },
        stdin = true,
    }
end

return {
    "mhartington/formatter.nvim",
    config = function()
        require("formatter").setup({
            filetype = {
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                },
                htmldjango = {
                    djhtml,
                },
                javascript = {
                    require("formatter.filetypes.javascript").prettier,
                },
                json = {
                    require("formatter.filetypes.json").jq,
                },
                lua = {
                    require("formatter.filetypes.lua").stylua,
                },
                markdown = {
                    require("formatter.filetypes.markdown").prettier,
                },
                python = {
                    require("formatter.filetypes.python").black,
                    reorder_python_imports,
                },
                sh = {
                    require("formatter.filetypes.sh").shfmt,
                },
            },
        })
    end,
}
