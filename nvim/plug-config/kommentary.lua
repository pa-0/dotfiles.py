require "kommentary.config".use_extended_mappings()

require "kommentary.config".configure_language(
    "lua",
    {
        single_line_comment_string = "--",
        prefer_single_line_comments = true
    }
)

require "kommentary.config".configure_language(
    "go",
    {
        single_line_comment_string = "//",
        prefer_single_line_comments = true
    }
)

require "kommentary.config".configure_language(
    "rust",
    {
        single_line_comment_string = "//",
        prefer_single_line_comments = true
    }
)
