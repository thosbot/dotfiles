"""""""
" Perl
"
"""""""
" TODO: Move to language-specific file
" My perl includes pod
let perl_include_pod=1

" Syntax color complex things like @{${"foo"}}
let perl_extended_vars=1

" Hook "K" to perldoc instead of man within perl files
setlocal keywordprg=perldoc

" Compile perl with make
setlocal makeprg=perl\ -Ilib\ -c\ %\ $*
setlocal errorformat=%f:%l:%m

" Tabularize
" https://github.com/godlygeek/tabular
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a> :Tabularize /=><CR>
vnoremap <Leader>a> :Tabularize /=><CR>
