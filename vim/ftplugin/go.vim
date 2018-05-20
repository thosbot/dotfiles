setlocal tabstop=4 noexpandtab
setlocal nolist
setlocal omnifunc=gocomplete#Complete
let g:go_disable_autoinstall = 0

"""""""
" Vim-Go settings
" https://github.com/fatih/vim-go
"
"""""""

" Jump between errors in quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Run a go-vim command
nmap <leader>b  <Plug>(go-build)
nmap <leader>r  <Plug>(go-run)
nmap <leader>t  <Plug>(go-test)

" TODO: Run gofmt on write

let foldmethod = 'syntax'

" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1

"""""""
" Gotags
"
"""""""

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" au BufWritePost *.go silent! !ctags -R &
