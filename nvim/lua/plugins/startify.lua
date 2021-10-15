local M = {}

function M.setup()
    local fn = vim.fn
    local g = vim.g

    local function git_modified()
        local files = fn.systemlist("git ls-files -m 2> /dev/null")
        return fn.map(files, "{'line': v:val, 'path': v:val}")
    end

    local function git_untracked()
        local files = fn.systemlist("git ls-files -o --exclude-standard 2> /dev/null")
        return fn.map(files, "{'line': v:val, 'path': v:val}")
    end

    vim.cmd [[
        augroup startify
            autocmd!
            autocmd User Startified setlocal cursorline
        augroup END
    ]]

    g.startify_files_number = 5
    g.startify_change_to_dir = 0
    g.startify_relative_path = 1
    g.startify_use_env = 1
    g.startify_padding_left = 4

    g.startify_lists = {
        {type = "dir", header = {"    Files " .. fn.getcwd()}},
        {
            type = git_modified,
            header = {"    Modified"}
        },
        {
            type = git_untracked,
            header = {"    Utracked"}
        },
        {type = "sessions", header = {"    Sessions"}},
        {type = "commands", header = {"    Plugins"}}
    }

    g.startify_commands = {}
    g.startify_custom_footer = {}
    g.startify_custom_header = {
        "",
        "     ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        "     ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        "     ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        "     ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        "     ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        "     ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        ""
    }
end

return M
