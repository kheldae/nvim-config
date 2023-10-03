set nofoldenable

let g:colors_loaded = 0

function SetGoyoColor()

if g:colors_loaded == 1
    call SetColor()
endif

hi Normal       guibg=NONE ctermbg=NONE
hi StatusLine   guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
hi VertSplit    guibg=NONE ctermbg=NONE

endfunction

call SetGoyoColor()
let g:colors_loaded = 1

" set limelight conceal
let g:limelight_conceal_ctermfg=0xa

" Make goyo a bit wider
let g:goyo_width=100

let g:startify_disable_at_vimenter=1

let g:copilot_enabled = 0

autocmd vimenter * Goyo
