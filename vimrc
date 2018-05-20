"""""""
" Vim
"
"""""""

set encoding=utf8
set nocompatible " non vi-compatible

"""""""
" Vundle - Github-based extension manager
"
"""""""
filetype off " required by vundle
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Base utility plugins

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vim utils used by many scripts
" http://www.vim.org/scripts/script.php?script_id=2940
Plugin 'vim-scripts/vim-addon-mw-utils'

" Even more utils
" http://www.vim.org/scripts/script.php?script_id=1863
Plugin 'tomtom/tlib_vim'

" xolox-required utils
Plugin 'xolox/vim-misc'

" Add "." repeating for plugin maps (supports vim-surround)
" https://github.com/tpope/vim-repeat
Plugin 'tpope/vim-repeat'

" Filesystem explorer
" Plugin 'scrooloose/nerdtree'

" Airline statusline
Plugin 'bling/vim-airline'

" Vim sugar for the UNIX shell commands that need it the most
Plugin 'tpope/vim-eunuch'

" Mapping pairs for ex commands, linewise, opt toggling, encoding/decoding
Plugin 'tpope/vim-unimpaired'

" Unicode character metadata
Plugin 'tpope/vim-characterize'

" Behaviour Plugins

" Commenting out lines of code
" Also check out: https://github.com/tomtom/tcomment_vim
Plugin 'tpope/vim-commentary'

" Insert or delete brackets, parens, quotes in pairs
" Alt: https://github.com/ervandew/matchem
Plugin 'jiangmiao/auto-pairs'

" SnipMate.vim aims to be a concise vim script that implements some of
" TextMate's snippets features in Vim.
" http://www.vim.org/scripts/script.php?script_id=2540
Plugin 'msanders/snipmate.vim'

" Aligning regions of text
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'

" Accessing Devel::CoverX::Covered database
" Inspired by: http://use.perl.org/use.perl.org/_Ovid/journal/36030.html
" https://metacpan.org/module/Devel::CoverX::Covered
Plugin 'omega/vim-covered'

" Get the current function name which your cursor is located at (supports
" vim-covered)
Plugin 'tyru/current-func-info.vim'

" Provides facilities to integrate Vim with the pandoc document converter and
" work with documents written in its markdown variant
" vim-pandoc doesn't provide syntax support. The user needs to install
" vim-pandoc/vim-pandoc-syntax
" http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax'

" HTML/XML mappings
" http://www.vim.org/scripts/script.php?script_id=1896
Plugin 'tpope/vim-ragtag'

" Surround with quotes, parens, HTML/XML elements, etc.
" http://www.vim.org/scripts/script.php?script_id=1697
Plugin 'tpope/vim-surround'

" Highlights the matching HTML tag when the cursor is positioned on a tag. It
" works in much the same way as the MatchParen plugin.
Plugin 'gregsexton/MatchTag'

" CTags
" automated tag file generation and syntax highlighting of tags in Vim
" http://peterodding.com/code/vim/easytags/
" Plugin 'xolox/vim-easytags'

" Browse the tags of the current file and get an overview of its structure
" via sidebar that displays the ctags-generated tags of the current file
" ordered by their scope.
Plugin 'majutsushi/tagbar'


" VCS PLUGINS
" CVS/SVN/SVK/git/hg/bzr integration plugin
" http://www.vim.org/scripts/script.php?script_id=90
" Plugin 'git://repo.or.cz/vcscommand'

" Git wrapper
Plugin 'tpope/vim-fugitive'
" Language-specific syntax and development plugins


" mustache.js
Plugin 'mustache/vim-mustache-handlebars'

" Golang
Plugin 'fatih/vim-go'
" Golang code completion daemon
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

" Chuck audio programming language
" http://www.vim.org/scripts/script.php?script_id=1880
Plugin 'vim-scripts/ck.vim'

" GitHub Flavored Markdown
Plugin 'jtratner/vim-flavored-markdown'

" GitHub Flavored Markdown Fenced code blocks
Plugin 'amiorin/vim-fenced-code-blocks'

" http://groups.google.com/group/vim-perl
Plugin 'vim-perl/vim-perl'

" Highlight perl variables
Plugin 'pjcj/vim-hl-var'

" Yet Another JS Syntax
Plugin 'othree/yajs.vim'

" HTML5
Plugin 'othree/html5.vim'

" Asynchronous markdown preview
" Plugin 'euclio/vim-markdown-composer'

call vundle#end()            " required



"""""""
" Built-in behaviors
"
"""""""
set noerrorbells
set visualbell

set confirm             " use confirm instead of aborting an action
set history=1000        " command line history
set complete=.,w,b,u,t  " word completion (C-n, C-p) settings
set showcmd             " show command in bottom bar
set lazyredraw          " redraw only when we need to

set ruler               " cursor position and percentage through file
set scrolloff=5         " min number of line above/below cursor
set sidescrolloff=10    " min number of columns (nowrap) l/r of cursor
set showmatch           " show matching paren/brace/bracket
set number              " line numbers w/ toggle (double C-n)
:nnoremap <C-n><C-n> :set invnumber<CR>

set wildmenu                " file/command tab completion -- show all opts
set wildmode=list:longest   " tab complete to ambiguity
if exists("+wildignorecase")
    set wildignorecase      " tab completions should ignore case
endif

filetype plugin on      " enable settings from plug-ins (ftplugin)
filetype indent on      " load filetype-specific indent files
runtime macros/matchit.vim

" Define and initialize an autocmd group `vimrc`
augroup vimrc
  autocmd!
augroup END

let g:mapleader = '\'

" Opening and sourcing .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

"""""""
" Indentation / tab stops / holy war
"
"""""""

"""""""
" Syntax highlighting / colors
"
"""""""
" 256: http://vim.wikia.com/wiki/256_colors_in_vim
set t_Co=256
" not necessary
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm

colorscheme peachpuff
syntax on
highlight comment ctermfg=darkgreen
" highlight comment cterm=italic ctermfg=darkgreen
highlight Search cterm=NONE ctermfg=grey ctermbg=blue
highlight MatchParen ctermbg=blue
highlight LineNr ctermfg=darkgray " line numbers

" set colorcolumn=79
" highlight ColorColumn ctermbg=magenta

" Highlight the line of cursor -- will make screen redrawing slower
" set cursorline
" highlight CursorLine term=bold cterm=bold guibg=Grey40

" Highlight EOL whitespace
set list
" Replace trailing whitespace chars with '.'
set listchars=trail:.
nmap <leader>l :set list!<CR>

" Softwrapping: linebreak won't split words, but doesn't work with list
command! -nargs=* Wrap set wrap linebreak nolist

" TODO: Mess with cursor color per vim docs
" http://vim.wikia.com/wiki/Configuring_the_cursor

" GitHub Flavored Markdown (GFM): fencepost (```) syntax highlighting

" Map dd to the black hole register
" nnoremap d "_d
" vnoremap d "_d
let g:markdown_fenced_languages = ['caml=mustache', 'css', 'go', 'html', 'javascript', 'js=javascript', 'json=javascript', 'perl', 'sh', 'vim', 'xml']

"""""""
" Files & buffers
"
"""""""
" Write changes to buffers before ! or changing the active buffer
" 'autowrite' could be conflicting with 'hidden'
" set autowrite

" set filetypes (setf)
autocmd vimrc BufNewFile,BufRead *.ck set filetype=ck         " ChucK (audio prog. language)
autocmd vimrc BufNewFile,BufRead *.tt set filetype=tt2html    " Perl Template Toolkit + HTML
autocmd vimrc BufNewFile,BufRead *.caml set filetype=html.mustache

" Allow bkgd of curr buffer w/o writing to disk, restore marks, and undo hist
set hidden

" Remember marks, registers, searches, buffer list when quitting
set viminfo='50,\"100,:100,%,n~/.viminfo

" Move dir where swaps are stored
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

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
:map <F7> :setlocal spell! spelllang=en_us<CR>


" Airline / powerline
set laststatus=2
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" blanking out unsupported unicode chars in 'hacker' font
let g:airline_symbols.maxlinenr = ''

" TODO
set noshowmode
set noruler
set noshowcmd

" Ctags
" set tags+=~/tags
" Tagbar : http://usevim.com/2013/02/01/vim-101-fancy-ctags/
nmap <F8> :TagbarToggle<CR>

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
:noremap <Leader> <Space> :silent noh<Bar>echo<CR>
" Don't immediately begin searching (reverse w/ set incsearch),
" ignorecase - case insensitive searching
" smartcase - turn off ignorecase when search term includes uppercase char
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



" INDENTATION / TAB STOPS / HOLY WAR
set smartindent     " let braces affect autoindentation
set tabstop=4       " make tab stops 4 spaces wide
set shiftwidth=4
set softtabstop=4   " make 4 spaces behave as tab (single backspace to delete)
set expandtab       " insert tabs as sets of spaces, not tab characters

" Keep vim's smart indenter from messing up pasted in text
set pastetoggle=<F11>
"""""""
" Environment
"
"""""""

" Screen
" Autoset screen window title (vimtip 1126), resets to xterm title on close
" FIXME: Can't get the old window title back yet -- defaults to xterm title
autocmd vimrc BufEnter * let &titlestring=expand("%:t")

" DRAGVISUALS Damian Conway
vnoremap <expr> H DVB_Drag('left')
vnoremap <expr> L DVB_Drag('right')
vnoremap <expr> J DVB_Drag('down')
vnoremap <expr> K DVB_Drag('up')
let g:DVB_TrimWS = 1 " remove any introduced trailing whitespace after move

" Source a local, machine-specific Vim RC
if filereadable($HOME.'/.config/vim/local.vim')
    :source $HOME/.config/vim/local.vim
endif

" Read a .vim file from the same directory as the file being edited
" http://stackoverflow.com/questions/1889602/multiple-vim-configurations
" let b:thisdir=expand("%:p:h")
" let b:vim=b:thisdir."/.vim"
" if (filereadable(b:vim))
"     execute "source ".b:vim
" endif

"""""""
" References
"
"""""""
" https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup
" https://github.com/tpope
" https://github.com/thoughtbot/dotfiles
