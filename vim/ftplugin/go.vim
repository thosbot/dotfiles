setlocal tabstop=4 noexpandtab
setlocal nolist

" https://github.com/fatih/vim-go/issues/3171
set regexpengine=2

let foldmethod = 'syntax'
" Dont auto-close folds on write
" https://github.com/fatih/vim-go/issues/502
autocmd BufWritePost *.go normal! zv

" Syntax highlighting
let g:go_highlight_braces=0
let g:go_highlight_brackets=0
let g:go_highlight_builtins=0
let g:go_highlight_dot=0
let g:go_highlight_function_call_parens=0
let g:go_highlight_generate_tags=0
let g:go_highlight_map_brackets=0
let g:go_highlight_parens=0
let g:go_highlight_semicolon=0
let g:go_highlight_slice_brackets=0
