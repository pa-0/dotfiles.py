scriptencoding utf-8

" Mappings
let mapleader = ','

" Save files and stuff
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wqa!<CR>
nnoremap <leader>e :wq!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :qa!<CR>

" Tabs, source and no highlight
nnoremap <leader>R :source $MYVIMRC<CR>
nnoremap <silent> <space> :noh<CR>

" make ^, 0 and $ work like you expect
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0
nnoremap <silent> $ g$

" Portview scroll faster
nnoremap <silent> <C-e> 3<c-e>
nnoremap <silent> <C-y> 3<c-y>

" Switch to last buffer
nnoremap <silent> <BS> <c-^>

" Keep in vsual mode after indentation
vmap <silent> < <gv
vmap <silent> > >gv

" More natural split navigation
nnoremap <C-l> <C-W>l
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h

" Terminal splitting
augroup terminalConfig
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * startinsert
augroup END

nnoremap <silent> <c-w>tv <c-w>v :term<CR>
nnoremap <silent> <c-w>ts <c-w>s :term<CR>
" Move from withing the terminal split
tnoremap <silent> <c-h> <c-\><c-n><c-w><c-h>
tnoremap <silent> <c-j> <c-\><c-n><c-w><c-j>
tnoremap <silent> <c-k> <c-\><c-n><c-w><c-k>
tnoremap <silent> <c-l> <c-\><c-n><c-w><c-l>
tnoremap <silent> <ESC> <c-\><c-n>

nnoremap <leader>DS :call <SID>format_docstrings()<CR>

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
