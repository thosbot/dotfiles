"""""""
" Vim
"
"""""""

set encoding=utf8
set nocompatible " non vi-compatible

"""""""
" Plugins
"
"""""""

call plug#begin('~/.vim/plugged')

" Base utility plugins

" Add dot (.) repeating for plugin maps (supports vim-surround)
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" Filesystem explorer
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'bling/vim-airline'      " Airline statusline
Plug 'tpope/vim-unimpaired'   " Mapping pairs for ex, linewise, opts, enc/dec
Plug 'tpope/vim-characterize' " Unicode character metadata

" Behaviour Plugins

Plug 'tpope/vim-commentary' " Commenting out lines of code
Plug 'tpope/vim-surround'   " Surround with quotes, parens, HTML/XML elements, etc.
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pairs
Plug 'godlygeek/tabular'    " Aligning regions of text

" Get the current function name which your cursor is located at (supports
" vim-covered)
Plug 'tyru/current-func-info.vim'

" Provides facilities to integrate Vim with the pandoc document converter and
" work with documents written in its markdown variant
" http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'ludovicchabant/vim-gutentags' " CTags
Plug 'lervag/file-line'             " Open files using file:linenum syntax
Plug 'tpope/vim-fugitive'           " Git wrapper
Plug 'airblade/vim-gitgutter'       " Show git diff in sign column

" Fuzzy filename search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Browse the tags of the current file and get an overview of its structure
" via sidebar that displays the ctags-generated tags of the current file
" ordered by their scope.
Plug 'majutsushi/tagbar'

" Language-specific syntax and development plugins
Plug 'dense-analysis/ale'   " Asynchronous Lint Engine

" Code autocompletion
Plug 'juliosueiras/vim-terraform-completion'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-scripts/ck.vim'   " Chuck audio programming language
Plug 'vim-perl/vim-perl'
Plug 'tpope/vim-ragtag'     " HTML/XML mappings
Plug 'othree/html5.vim'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/dockerfile.vim'
Plug 'tbastos/vim-lua'

Plug 'jtratner/vim-flavored-markdown' " GitHub Flavored Markdown
Plug 'amiorin/vim-fenced-code-blocks'

" JavaScript, et al.
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars'
Plug 'leafOfTree/vim-vue-plugin'

" Highlights the matching HTML tag when the cursor is positioned on a tag. It
" works in much the same way as the MatchParen plugin.
Plug 'gregsexton/MatchTag'

Plug 'https://gitlab.com/gi1242/vim-emoji-ab'
Plug 'ryanoasis/vim-devicons'

" Colorschemes
Plug 'sainnhe/sonokai'
Plug 'Reewr/vim-monokai-phoenix'
Plug 'kajamite/vim-monokai2'
Plug 'elvessousa/elf-monokai-pro'

call plug#end()

"""""""
" Builtin behaviors
"
"""""""

set noerrorbells
set visualbell

set confirm             " use confirm instead of aborting an action
set history=1000        " command line history
set complete=.,w,b,u,t  " word completion (C-n, C-p) settings
set completeopt=menu,menuone,noinsert,noselect
set ttyfast             " Faster redrawing
set showcmd             " show command in bottom bar
set lazyredraw          " redraw only when we need to
set viewoptions=folds,options,cursor,unix,slash
set updatetime=100      " default delay before updating in milliseconds

set ruler               " cursor position and percentage through file
set scrolloff=5         " min number of line above/below cursor
set sidescrolloff=10    " min number of columns (nowrap) l/r of cursor
set showmatch           " show matching paren/brace/bracket
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join
set virtualedit=onemore " Allow for cursor beyond last character
set number              " line numbers w/ toggle (double C-n)

set wildmenu                " file/command tab completion -- show all opts
set wildmode=list:longest   " tab complete to ambiguity
if exists("+wildignorecase")
    set wildignorecase      " tab completions should ignore case
endif

" set mouse=a                 " Automatically enable mouse usage
" set ttymouse=xterm
set mousehide               " Hide the mouse cursor while typing

filetype plugin on      " enable settings from plug-ins (ftplugin)
filetype indent on      " load filetype-specific indent files
runtime macros/matchit.vim

" Set to auto read when a file is changed from the outside
set autoread

" Define and initialize an autocmd group `vimrc`
augroup vimrc
    " Vim won't clear out the group if it already existed, so do that here.
    autocmd!
augroup END

let g:mapleader = '\'

" Opening and sourcing .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Line number and sign column toggling
nnoremap <C-n><C-n> :set invnumber<CR>
nnoremap <C-s><C-s> :call ToggleSignColumn()<CR>
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=number
        let b:signcolumn_on=1
    endif
endfunction

"""""""
" Indentation / tab stops / holy war
"
"""""""
set smartindent     " let braces affect autoindentation
set tabstop=4       " make tab stops 4 spaces wide
set shiftwidth=4
set smarttab        " Insert blanks using shiftwidth, not tabstop/softtabstop
set softtabstop=4   " make 4 spaces behave as tab (single backspace to delete)
set expandtab       " insert tabs as sets of spaces, not tab characters

" Keep vim's smart indenter from messing up pasted in text
set pastetoggle=<F11>

" Tabularize
" https://github.com/godlygeek/tabular
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>

"""""""
" Syntax highlighting / colors
"
"""""""

" set t_Co=256 " 256 colors
" set termguicolors
colorscheme monokai-phoenix
syntax on
highlight comment cterm=italic ctermfg=darkgray
highlight Search cterm=NONE ctermbg=darkgray ctermfg=white
highlight MatchParen ctermbg=blue
highlight LineNr ctermfg=darkgray " line numbers
highlight GitGutterAdd ctermbg=black ctermfg=darkgray
highlight Normal ctermbg=None

" Toggle color column via command or F2
highlight ColorColumn ctermbg=darkgray
command! ToggleCC :let &cc = &cc == '' ? '80' : ''
nnoremap <F2> :let &cc = &cc == '' ? '80' : ''<CR>

" Highlight the line of cursor -- will make screen redrawing slower
set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40

set list
set listchars=trail:. " Replace trailing whitespace chars with '.'
nmap <leader>l :set list!<CR>

" Remove trailing whitespace
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
nmap <leader>t :call TrimWhiteSpace()<CR>

" Softwrapping - linebreak won't split words, but doesn't work with list
command! -nargs=* Wrap set wrap linebreak nolist

" TODO:  Mess with cursor color per vim docs
" http://vim.wikia.com/wiki/Configuring_the_cursor

" GitHub Flavored Markdown (GFM): fencepost (```) syntax highlighting
let g:markdown_fenced_languages = [ 'caml=mustache', 'css', 'go', 'html', 'javascript', 'js=javascript', 'json=javascript', 'perl', 'sh', 'sql', 'vim', 'xml', 'yaml', 'yml=yaml' ]

" Allow to trigger background
" FIXME: Light background doesn't appear to completely reset everything that
"        dark changed.
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>

"""""""
" Files & buffers
"
"""""""

" Fuzzy file match
nnoremap <C-p> :<C-u>FZF<CR>

let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  } }

" set filetypes (setf)
autocmd vimrc BufNewFile,BufRead *.ck set filetype=ck         " ChucK (audio prog. language)
autocmd vimrc BufNewFile,BufRead *.tt set filetype=tt2html    " Perl Template Toolkit + HTML
autocmd vimrc BufNewFile,BufRead *.caml set filetype=html.mustache
autocmd vimrc BufNewFile,BufRead *.md set filetype=markdown
autocmd vimrc BufNewFile,BufRead Jenkinsfile setf groovy

" Allow bkgd of curr buffer w/o writing to disk, restore marks, and undo hist
set hidden

" Map dd to the black hole register
" nnoremap d "_d
" vnoremap d "_d

" Remember marks, registers, searches, buffer list when quitting
set viminfo='50,\"100,:100,%,n~/.viminfo

" Jump to the last position when reopening a file
autocmd vimrc BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Default splits to below (sp) and right (vsp)
set splitbelow
set splitright

" Set clipboard to system and xwin (if avail) clipboard
set clipboard=unnamed
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif
set backspace=indent,eol,start

" Spellcheck mimics MS Word F7
map <F7> :setlocal spell! spelllang=en_us<CR>
" Underline and bold mis-spelled words and color red
highlight clear SpellBad
highlight SpellBad cterm=undercurl,bold ctermfg=red

" Improve dropdown highlighting
highlight Pmenu ctermbg=238 gui=bold

" Airline / powerline
set laststatus=2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :TagbarToggle<CR><C-w>l

let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_balloons = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '.'
let g:airline#extensions#ale#enabled = 1

"""""""
" Movement / motion
"
"""""""

" Move through display lines in normal mode, rather than numbered lines
vnoremap <C-j> gj
vnoremap <C-k> gk
vnoremap <C-4> g$
vnoremap <C-6> g^
vnoremap <C-0> g^

nnoremap <C-j> gj
nnoremap <C-k> gk
nnoremap <C-4> g$
nnoremap <C-6> g^
nnoremap <C-0> g^

"""""""
" Searching
"
"""""""

" Highlighting for searches - turn off with spacebar
set hlsearch
noremap <Leader> <Space> :silent noh<Bar>echo<CR>
" noincsearch - don't immediately begin searching (reverse w/ set incsearch),
" ignorecase  - case insensitive searching
" smartcase   - turn off ignorecase when search term includes uppercase char
set noincsearch ignorecase smartcase

if executable("ack")
    set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" From Damian Conway: ring match highlighting in red
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    highlight RedOnRed ctermfg=red ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    echo matchlen
    let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
            \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
            \ . '\|'
            \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
            \ . '\|'
            \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
    let ring = matchadd('RedOnRed', ring_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 750) . 'm'
    call matchdelete(ring)
    redraw
endfunction

"""""""
" Folding
"
"""""""

highlight Folded term=NONE cterm=NONE ctermbg=NONE guibg=NONE
set nofoldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=0

set fillchars=fold:\  " Replace annoying fold chars with space
set foldtext=MyFoldText()
function! MyFoldText()
    " TODO: Could you calculate indentation?
    " let spaces = indent(v.foldend) / &shiftwidth
    " return repeat(' ', spaces) . '•••'
    return '  •••'
endfunction

"""""""
" Environment
"
"""""""

" Tmux
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")

" Source a local, machine-specific Vim RC
if filereadable($HOME.'/.config/vim/local.vim')
    source $HOME/.config/vim/local.vim
endif

" Read a .vim file from the same directory as the file being edited
" http://stackoverflow.com/questions/1889602/multiple-vim-configurations
" let b:thisdir=expand("%:p:h")
" let b:vim=b:thisdir."/.vim"
" if (filereadable(b:vim))
"     execute "source ".b:vim
" endif

let g:tex_flavor='latex'
let g:ragtag_global_maps = 1 " Set default ragtag key mappings

function! s:ToggleBlame()
    if &l:filetype ==# 'fugitiveblame'
        close
    else
        Git blame
    endif
endfunction
nnoremap <leader>gb :call <SID>ToggleBlame()<CR>

"""""""
" spf-13-vim : http://vim.spf13.com/
"
"""""""

scriptencoding utf-8

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 0
