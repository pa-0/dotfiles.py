let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

augroup rainbow
    autocmd!
    autocmd FileType * RainbowParentheses
augroup END
