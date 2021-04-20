" Beacon Config
let g:beacon_show_jump = 0
let g:beacon_ignore_filetypes = ['fzf', 'Plugins', 'Startify']

" Use beacon whenever jumping in searches
nmap <silent> n n:Beacon<cr>
nmap <silent> N N:Beacon<cr>
nmap <silent> * *:Beacon<cr>
nmap <silent> # #:Beacon<cr>
