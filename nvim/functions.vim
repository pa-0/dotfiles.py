" Docstring autoformatter
function! <SID>format_docstrings()
    let l = line('.')
    let c = col('.')
    %!docformatter -c --wrap-summaries $PYTHON_LINE_LENGTH --wrap-descriptions $PYTHON_LINE_LENGTH -
    call cursor(l, c)
endfun
