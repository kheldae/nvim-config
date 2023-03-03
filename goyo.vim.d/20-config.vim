set nofoldenable

hi Normal ctermbg=NONE
hi StatusLine ctermbg=NONE
hi VertSplit ctermbg=NONE

" set limelight conceal
let g:limelight_conceal_ctermfg=0xa

" Make goyo a bit wider
let g:goyo_width=100

let g:startify_disable_at_vimenter=1

let g:copilot_enabled = 0

let g:loaded_python3_provider = 0

autocmd vimenter * Goyo
