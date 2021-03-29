" required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'go': ['~/.local/bin/gopls'],
    \ 'python': ['~/.local/bin/jedi-language-server'],
    \ 'rust': ['~/.config/cargo/bin/rustup', 'run', 'stable', 'rls']
    \ }

" note that if you are using Plug mapping you should not use `noremap`mappings.
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> <leader>d <Plug>(lcn-definition)
nmap <silent> <leader>r <Plug>(lcn-rename)
nmap <silent> <leader>s <Plug>(lcn-references)
nmap <silent> ]d <Plug>(lcn-Diagnostics-next)
nmap <silent> [d <Plug>(lcn-Diagnostics-prev)
