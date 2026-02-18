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
Plug 'junegunn/fzf.vim'

" Browse the tags of the current file and get an overview of its structure
" via sidebar that displays the ctags-generated tags of the current file
" ordered by their scope.
Plug 'preservim/tagbar'

" Language-specific syntax and development plugins
Plug 'dense-analysis/ale'   " Asynchronous Lint Engine / ALE (LSP)

Plug 'charlespascoe/vim-go-syntax'
Plug 'vim-perl/vim-perl'
Plug 'tpope/vim-ragtag'     " HTML/XML mappings
Plug 'othree/html5.vim'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'ekalinin/dockerfile.vim'
Plug 'tbastos/vim-lua'
Plug 'pangloss/vim-javascript'
Plug 'amadeus/vim-mjml'

" Highlights the matching HTML tag when the cursor is positioned on a tag. It
" works in much the same way as the MatchParen plugin.
Plug 'gregsexton/MatchTag'

Plug 'https://gitlab.com/gi1242/vim-emoji-ab'
Plug 'ryanoasis/vim-devicons'

" Colorschemes
Plug 'Reewr/vim-monokai-phoenix'
Plug 'tomasiser/vim-code-dark'

" https://editorconfig.org
Plug 'editorconfig/editorconfig-vim'

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
set number              " line numbers w/ toggle

" Show as much of the last line as will fit
set display+=lastline
if has('patch-7.4.2109')
    set display+=truncate
endif

" Make the escape key more responsive by decreasing the wait time for an
" escape sequence (e.g., arrow keys)
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" TODO: Look into permanently using the new NFA regex engine -- typescript and
"       go files slow down terribly when auto (and prob old) engine is set.
" set regexpengine=2

set wildmenu                   " Enhanced command-line tab completion
set wildmode=list:longest,full " Complete to longest possible match, then tab through list
if exists("+wildignorecase")
    set wildignorecase         " Tab completions should ignore case
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
nnoremap ]g :call DisableGutter()<CR>
function! DisableGutter()
    set signcolumn=no
    let b:signcolumn_on=0
    let gitgutter_enabled=0
    set invnumber
endfunction

nnoremap [g :call EnableGutter()<CR>
function! EnableGutter()
    set signcolumn=yes
    let b:signcolumn_on=1
    let gitgutter_enabled=1
    set invnumber
endfunction

function! ToggleRelativeNumber()
  if(&nu == 1)
    set nu!
    set rnu
  else
    set nornu
    set nu
  endif
endfunction
nnoremap <C-n> :call ToggleRelativeNumber()<CR>

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
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>

"""""""
" Syntax highlighting / colors
"
"""""""
if has('termguicolors')
    set termguicolors
else
    set t_Co=256
endif

colorscheme codedark
syntax on

highlight comment cterm=italic ctermfg=darkgray
highlight todo cterm=italic ctermfg=yellow
highlight Search cterm=NONE ctermbg=darkgray ctermfg=white
highlight MatchParen ctermbg=blue
highlight LineNr ctermbg=black ctermfg=darkgray " line numbers

" Toggle color column
highlight ColorColumn ctermbg=darkgray
command! ToggleCC :let &cc = &cc == '' ? '80' : ''
nnoremap <F2> :let &cc = &cc == '' ? '80' : ''<CR>

set cursorline
highlight CursorLine term=bold cterm=bold
" Set cursorline in active window only
augroup CursorLine
    au! VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

set listchars=tab:>-,trail:•,nbsp:␣,eol:⏎
nmap <leader>l :set list!<CR>

function TrimTrailingWhitespace()
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")

    " Trim trailing whitespace
    %s/\s\+$//e

    " Restore previous search history and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <leader>t :call TrimTrailingWhitespace()<CR>

" Softwrapping - linebreak won't split words, but doesn't work with list
command! -nargs=* Wrap set wrap linebreak nolist

" TODO: Mess with cursor color per vim docs
" http://vim.wikia.com/wiki/Configuring_the_cursor

" TODO: Add a keymap to close help window :helpclose

" GitHub Flavored Markdown (GFM): fencepost (```) syntax highlighting
let g:markdown_fenced_languages = [ 'css', 'go', 'html', 'javascript', 'js=javascript', 'json=javascript', 'perl', 'sh', 'sql', 'vim', 'xml', 'yaml', 'yml=yaml' ]

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

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

"""""""
" Files & buffers
"
"""""""

" Fuzzy file match
nnoremap <C-p> :<C-u>FZF<CR>

" Reuse an existing window/split if the target file is already open
set switchbuf=useopen,usetab

let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  } }

" set filetypes (setf)
autocmd vimrc BufNewFile,BufRead *.ck set filetype=ck         " ChucK (audio prog. language)
autocmd vimrc BufNewFile,BufRead *.tt set filetype=tt2html    " Perl Template Toolkit + HTML
autocmd vimrc BufNewFile,BufRead *.md set filetype=markdown
autocmd vimrc BufNewFile,BufRead Jenkinsfile setf groovy

" Allow bkgd of curr buffer w/o writing to disk, restore marks, and undo hist
set hidden

" Map dd to the black hole register
nnoremap d "_d
vnoremap d "_d

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

" Allow backspace to delete indentation and inserted text
set backspace=indent,eol,start

" Spellcheck mimics MS Word F7
map <F7> :setlocal spell! spelllang=en_us<CR>
highlight clear SpellBad
highlight SpellBad cterm=undercurl,bold ctermfg=red

" Improve dropdown highlighting
highlight Pmenu ctermbg=238 gui=bold

" Airline / powerline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :TagbarToggle<CR><C-w>l

"""""""
" ALE
"
"""""""
let g:ale_enabled=1
let g:ale_completion_enabled=1
let g:ale_fix_on_save=1
let g:airline#extensions#ale#enabled=1

let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=1
let g:ale_lint_on_insert_leave=0

let g:ale_set_highlights=0
let g:ale_set_balloons=0
let g:ale_floating_preview=1
let g:ale_cursor_detail=0
let g:ale_echo_delay=100
let g:ale_virtualtext_cursor='current'

let g:ale_set_signs=1
let g:ale_sign_error='ⓧ'
let g:ale_sign_warning='⚠'
let g:ale_sign_info='ⓘ'

highlight ALEErrorSign cterm=NONE ctermbg=NONE ctermfg=red
highlight ALEWarningSign cterm=NONE ctermbg=NONE ctermfg=yellow
highlight ALEInfoSign cterm=NONE ctermbg=NONE ctermfg=blue

" Set keymappings if a LSP is found running
function ALELSPMappings()
    let l:lsp_found=0
    for linter in ale#linter#Get(&filetype)
        " ale#lsp_linter#CheckWithLSP() is undocumented / not protected from
        " future breaking changes
        if !empty(linter.lsp) && ale#lsp_linter#CheckWithLSP(bufnr(''), linter)
            let lsp_found=1
        endif
    endfor

    if (l:lsp_found)
        nnoremap <buffer> K :ALEDocumentation<cr>
        nnoremap <buffer> <C-]> :ALEGoToDefinition<CR>
        nnoremap <buffer> <C-^> :ALEFindReferences<CR>
        nnoremap <buffer> <C-h> :ALEHover<cr>
        nnoremap <buffer> <C-i> :ALEGoToImplementation<CR>

        nnoremap <buffer> gr :ALEFindReferences<cr>
        nnoremap <buffer> gd :ALEGoToDefinition<cr>
        nnoremap <buffer> gy :ALEGoToTypeDefinition<cr>
        nnoremap <buffer> gh :ALEHover<cr>

        setlocal omnifunc=ale#completion#OmniFunc
    else
        silent! unmap <buffer> <C-]>
        silent! unmap <buffer> <C-^>
    endif
endfunction
autocmd BufRead,FileType * call ALELSPMappings()


"""""""
" Movement / motion
"
"""""""

" Move through display lines in normal mode, rather than numbered lines
vnoremap <C-j> gj
vnoremap <C-k> gk
vnoremap <C-4> g$
vnoremap <C-6> g^

nnoremap <C-j> gj
nnoremap <C-k> gk
nnoremap <C-4> g$
nnoremap <C-6> g^

"""""""
" Searching
"
"""""""

" Highlighting for searches - turn off with spacebar
set hlsearch
noremap <Leader> <Space> :silent noh<Bar>echo<CR>
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

    " Get virtual column from real column (byte-indexed)
    let virt_col = virtcol([lnum, col])
    let start_virt = max([virt_col - 4, 1])
    let end_virt   = virt_col + matchlen + 2

    let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.start_virt .'v\%<'.(end_virt + 1).'v.\|' : '')
        \ . '\%'.lnum.'l\%>'.start_virt.'v\%<'.virt_col.'v.'
        \ . '\|'
        \ . '\%'.lnum.'l\%>'.(virt_col + matchlen - 1).'v\%<'.(end_virt + 1).'v.'
        \ . '\|'
        \ . '\%'.(lnum+1).'l\%>'.start_virt.'v\%<'.(end_virt + 1).'v.'

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

highlight clear Folded
set nofoldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=0

set foldcolumn=0
set fillchars+=fold:\ ,foldopen:▾,foldsep:\ ,foldclose:▸

set foldtext=MyFoldText()
function! MyFoldText()
    let indent_level = indent(v:foldstart)
    return repeat(' ', indent_level) . '•••'
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
        Git blame --ignore-space-change
    endif
endfunction
nnoremap <leader>gb :call <SID>ToggleBlame()<CR>

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

scriptencoding utf-8

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Pretty print JSON
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 0
