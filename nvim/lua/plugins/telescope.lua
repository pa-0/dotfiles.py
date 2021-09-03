local telescope = require("telescope")

local function nnoremap(mapping, command)
    local opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap("n", mapping, command, opts)
end

nnoremap("gfg", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("gff", "<cmd>lua require('telescope.builtin').live_grep()<CR>")

nnoremap("<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>")

telescope.load_extension("fzf")
telescope.setup {
    defaults = {
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
