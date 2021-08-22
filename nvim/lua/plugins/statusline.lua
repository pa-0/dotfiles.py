-- Eviline config for lualine

-- Author: shadmansaleh
-- Credit: glepnir

local colors = {
    bg = "#2E3440",
    fg = "#E5E9F0",
    yellow = "#EBCB8B",
    cyan = "#88C0D0",
    darkblue = "#5E81AC",
    green = "#A3BE8C",
    orange = "#D08770",
    violet = "#8A3FA0",
    magenta = "#B48EAD",
    blue = "#81A1C1",
    red = "#BF616A"
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 79
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

local section_color = {fg = colors.fg, bg = colors.gb}

require("lualine").setup {
    options = {
        theme = {
            normal = {
                a = section_color,
                b = section_color,
                c = section_color
            },
            inactive = {
                x = section_color,
                y = section_color,
                z = section_color
            }
        },
        component_separators = "",
        section_separators = ""
    },
    extensions = {"fzf", "nvim-tree"},
    sections = {
        lualine_a = {
            {
                function()
                    return "▊"
                end,
                color = {fg = colors.violet},
                left_padding = 0
            }
        },
        lualine_b = {
            {
                function()
                    local mode_color = {
                        n = colors.red,
                        i = colors.blue,
                        v = colors.green,
                        [""] = colors.green,
                        V = colors.green,
                        c = colors.magenta,
                        no = colors.red,
                        s = colors.orae,
                        S = colors.orange,
                        [""] = colors.orange,
                        ic = colors.yellow,
                        R = colors.violet,
                        Rv = colors.violet,
                        cv = colors.red,
                        ce = colors.red,
                        r = colors.cyan,
                        rm = colors.cyan,
                        ["r?"] = colors.cyan,
                        ["!"] = colors.red,
                        t = colors.red
                    }
                    vim.api.nvim_command(
                        "hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg
                    )
                    return ""
                end,
                color = "LualineMode",
                left_padding = 0
            }
        },
        lualine_c = {
            {
                "branch",
                icon = "",
                condition = conditions.check_git_workspace,
                color = {fg = colors.darkblue, gui = "bold"}
            },
            {
                "diff",
                symbols = {added = " ", modified = " ", removed = " "},
                color_added = colors.green,
                color_modified = colors.orange,
                color_removed = colors.red,
                condition = conditions.hide_in_width
            },
            {
                function()
                    return "%="
                end
            },
            {
                function()
                    local msg = "No Active Lsp"
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = "  LSP:",
                color = {fg = colors.violet}
            },
            {
                "diagnostics",
                condition = conditions.hide_in_width,
                sources = {"nvim_lsp"},
                symbols = {error = " ", warn = " ", info = " "},
                color_error = colors.red,
                color_warn = colors.yellow,
                color_info = colors.cyan
            }
        },
        -- Right Sections
        lualine_x = {
            {
                "filename",
                condition = conditions.buffer_not_empty,
                color = {fg = colors.blue, gui = "bold"}
            },
            {
                "location",
                condition = conditions.hide_in_width
            },
            {
                "fileformat",
                condition = conditions.hide_in_width
            }
        },
        lualine_y = {
            {
                "filetype",
                condition = conditions.buffer_not_empty
            }
        },
        lualine_z = {
            {
                function()
                    return "▊"
                end,
                color = {fg = colors.violet},
                right_padding = 0
            }
        }
    },
    inactive_sections = {
        lualine_a = {"filename"},
        lualine_v = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {}
    }
}
