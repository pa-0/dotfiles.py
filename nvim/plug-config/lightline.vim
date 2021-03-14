scriptencoding utf-8

let g:lightline = {
\ 'colorscheme': 'nord',
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['gitbranch', 'gitdiff'],
\     ['filename', 'modified', 'readonly'],
\   ],
\   'right': [
\     ['linter_warnings', 'linter_errors'],
\     ['filetype', 'fileformat', 'filenameencoding'],
\     ['virtualenv'],
\   ],
\ },
\ 'inactive': {
\   'left': [
\     [], [], ['filename'],
\   ],
\   'right': [
\     [], [], ['filetype']
\   ],
\ },
\ 'tabline': {
\   'left': [ ['tabs'] ],
\   'right': [],
\ },
\ 'tabs': {
\   'active': ['filename', 'modified'],
\   'inactive': ['filename', 'modified'],
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead',
\   'readonly': 'LightlineReadonly',
\   'filenameencoding': 'LightlineFileEncoding',
\   'fileformat': 'LightlineFileFormat',
\   'filename': 'LightlineFileName',
\   'virtualenv': 'poetv#statusline'
\ }
\ }

let g:lightline.component_expand = {
\ 'linter_warnings': 'lightline#ale#warnings',
\ 'linter_errors': 'lightline#ale#errors',
\ 'gitdiff': 'lightline#gitdiff#get',
\ }

let g:lightline.component_type = {
\ 'linter_warnings': 'warning',
\ 'linter_errors': 'error',
\ 'gitdiff': 'middle',
\ }

let g:lightline#ale#indicator_warnings = '  '
let g:lightline#ale#indicator_errors  = '  '

let g:lightline#gitdiff#indicator_added = '+'
let g:lightline#gitdiff#indicator_deleted = '-'
let g:lightline#gitdiff#indicator_modified = '~'
let g:lightline#gitdiff#separator = ' '

function! LightlineReadonly()
    " Check wether a file is readonly
    return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineFileEncoding()
    " Only return the file encoding if it's not utf-8
    return &fileencoding ==? 'utf-8' ? '' : &fileencoding
endfunction

function! LightlineFileFormat()
    " only show the file format if it's not 'unix'
    return &fileformat ==? 'unix' ? '' : &fileformat
endfunction

function! LightlineFileName() abort
    let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
    let modified = &modified ? ' +' : ''
    return fnamemodify(filename, ':~:.') . modified
endfunction
