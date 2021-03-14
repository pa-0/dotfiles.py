let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}

augroup fzfconfig
    autocmd! FileType fzf
    autocmd  Filetype fzf set noshowmode noruler nonu
augroup END

if isdirectory('.git')
    nnoremap <leader>f :GitFiles --cache --others --exclude-standard<CR>
else
    nnoremap <leader>f :FZF<CR>
endif

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>, :Rg<CR>
nnoremap <leader>c :Commands<CR>
