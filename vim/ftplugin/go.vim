setlocal tabstop=4 noexpandtab
setlocal nolist
let g:go_disable_autoinstall = 0

" GoCode autocomplete
setlocal omnifunc=gocomplete#Complete

"""""""
" Vim-Go settings
" https://github.com/fatih/vim-go
"
"""""""

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Don't write boilerplate when opening a new Go file
let g:go_template_autocreate = 0

" Show function signature in status line (GoInfo)
nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1

" Highlight all matching identifiers (GoSameIds)
" let g:go_auto_sameids = 1
" TODO: GoSameIdsToggle

" Jump between errors in quickfix list
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Run a go-vim command
nmap <leader>b  <Plug>(go-build)
nmap <leader>r  <Plug>(go-run)
nmap <leader>t  <Plug>(go-test)


let foldmethod = 'syntax'
" Dont auto-close folds on write
" https://github.com/fatih/vim-go/issues/502
autocmd BufWritePost *.go normal! zv

" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_generate_tags = 1

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

" Increase the size of the tagbar
let g:tagbar_width=64
