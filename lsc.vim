Plug 'natebosch/vim-lsc'

" LSC
let g:lsc_auto_map = v:true
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:true
let g:lsc_reference_highlights = v:true
let g:lsc_trace_level          = 'off'

let g:lsc_server_commands = {
\   "perl": {
\       "command": "perl",
\   },
\}
