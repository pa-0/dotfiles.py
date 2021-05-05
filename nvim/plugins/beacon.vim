" Beacon Config
let g:beacon_show_jump = 0
let g:beacon_ignore_filetypes = ['fzf', 'Plugins', 'Startify', 'Registers']

" Use beacon whenever jumping in searches
nmap <silent> nzz n:Beacon<cr>
nmap <silent> Nzz N:Beacon<cr>
nmap <silent> *zz *:Beacon<cr>
nmap <silent> #zz #:Beacon<cr>
>>>>>>> aed9e94 ([nvim] Config for beacon)
