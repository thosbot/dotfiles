setlocal tabstop=4 noexpandtab
setlocal nolist
let g:go_disable_autoinstall = 0
let g:ale_completion_enabled = 0

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Jump between errors in quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

let g:go_fold_enable = 1
let g:foldmethod = 'syntax'
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
