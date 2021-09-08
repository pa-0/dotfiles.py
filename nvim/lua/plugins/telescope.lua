local telescope = require("telescope")

function remap(mode, mapping, command)
    local opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap(mode, mapping, command, opts)
end

remap("n", "gfg", "<cmd>lua require('telescope.builtin').find_files()<CR>")
remap("n", "gff", "<cmd>lua require('telescope.builtin').live_grep()<CR>")

remap("n", '"', "<cmd>lua require('telescope.builtin').registers()<CR>")
remap("i", "<c-r>", "<cmd>lua require('telescope.builtin').registers()<CR>")

remap("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>")
remap("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<CR>")

telescope.load_extension("fzf")
telescope.setup(
    {
        defaults = {
            prompt_prefix = " ",
            use_less = false,
            sorting_strategy = "ascending",
            layout_config = {
                height = 0.66,
                width = 0.85
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = false,
                override_file_sorter = true,
                case_modes = "smart_case"
            }
        }
    }
)
