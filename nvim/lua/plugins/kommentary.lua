local konfig = require("kommentary.config")
local M = {}

function M.setup()
    konfig.use_extended_mappings()

    local configure_language = konfig.configure_language

    configure_language("lua", {single_line_comment_string = "--", prefer_single_line_comments = true})
    configure_language("go", {single_line_comment_string = "//", prefer_single_line_comments = true})
    configure_language("rust", {single_line_comment_string = "//", prefer_single_line_comments = true})
end

return M
