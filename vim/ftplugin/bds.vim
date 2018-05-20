" The BDS
autocmd vimrc BufNewFile,BufRead *.bds setf bds
" Include dashes in word names for component ctags (FM000-000-001)
autocmd vimrc FileType bds set iskeyword+=-,:
