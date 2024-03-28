set nofoldenable
set nolist

" Enable Coq completion engine
let g:coq_settings = { 'auto_start': 'shut-up' }

" set limelight conceal
let g:limelight_conceal_ctermfg=0xa

" Common configuration values
let g:startify_disable_at_vimenter=1
let g:copilot_enabled = 0

" True-Zen launch
autocmd vimenter * TZAtaraxis
