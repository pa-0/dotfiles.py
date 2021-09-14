local telescope = require("telescope")

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
