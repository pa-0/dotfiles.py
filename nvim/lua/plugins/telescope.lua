local M = {}

local telescope = require("telescope")
local actions = require("telescope.actions")

function M.setup()
    telescope.load_extension("fzf")

    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<c-j>"] = actions.move_selection_next,
                    ["<c-k>"] = actions.move_selection_previous,
                    -- source: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#mapping-esc-to-quit-in-insert-mode
                    ["<esc>"] = actions.close,
                    ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
                    ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
                    ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
                },
            },
            file_ignore_patterns = { "node_modules", "%.git" },
            prompt_prefix = " ",
            use_less = false,
            sorting_strategy = "ascending",
            selection_caret = "  ",
            entry_prefix = "  ",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "bottom",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            path_display = { "truncate" },
            border = {},
            set_env = { ["COLORTERM"] = "truecolor" },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = false,
                override_file_sorter = true,
                case_modes = "smart_case",
            },
        },
    })
end

function M.project_files()
    local builtin = require("telescope.builtin")
    local opts = {}

    local ok = pcall(builtin.git_files, opts)

    if not ok then
        builtin.find_files(opts)
    end
end

return M
