scriptencoding utf-8

augroup startify
    autocmd!
    autocmd User Startified setlocal cursorline
augroup END

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Don't change to directory when selecting a file
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_padding_left = 4

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
\ { 'type': 'dir', 'header': ['    Files '. getcwd()] },
\ { 'type': function('s:gitModified'),  'header': ['    Modified']},
\ { 'type': function('s:gitUntracked'), 'header': ['    Untracked']},
\ { 'type': 'sessions',  'header': ['    Sessions'] },
\ { 'type': 'commands',  'header': ['    Plugins'] },
\ ]

let g:startify_commands = [
\ { 'up': [ 'Update Plugins', ':PackerUpdate' ] },
\ { 'in': [ 'Install New Plugins', 'PackerInstall' ] },
\ { 'cc': [ 'Compile lua configuration', 'PackerCompile' ] },
\ { 'cl': [ 'Cleanup untracker Plugins', ':PackerClean' ] },
\ ]

let g:startify_custom_footer = ''

let g:startify_custom_header = [
\ '',
\ '     ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ '     ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ '     ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ '     ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ '     ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ '     ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\ '',
\]
