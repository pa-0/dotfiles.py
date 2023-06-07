return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        format = {
            level = {
                icons = { error = " ", warn = " ", info = " " },
            },
        },
        messages = {
            view = "mini",
            view_error = "mini",
            view_warn = "mini",
            view_history = "messages",
            view_search = "mini",
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false, --
            lsp_doc_border = false,
        },
    },
}
