noremap <plug>(slash-after) zz

if has('timers')
    " Blink 2 times with 50ms interval
    noremap <expr> <plug>(slash-after) 'zz'.slash#blink(3, 50)
endif
