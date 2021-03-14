let g:deoplete#enable_at_startup = 1

" Completion selection candidates using TAB/S-TAB
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Close preview window after completion
augroup deopleteConfig
    autocmd!
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
augroup END
