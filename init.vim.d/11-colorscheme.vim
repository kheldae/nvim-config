" Molokai color
if system('zsh -ic _get_theme') == 'light' " Rely on zsh script for dark/light
    set background='light'
    colorscheme garden
else
    colorscheme skyknight
endif

let g:CSApprox_hook_post = [
            \ 'highlight Normal            ctermbg=NONE',
            \ 'highlight LineNr            ctermbg=NONE',
            \ 'highlight SignifyLineAdd    cterm=bold ctermbg=NONE ctermfg=green',
            \ 'highlight SignifyLineDelete cterm=bold ctermbg=NONE ctermfg=red',
            \ 'highlight SignifyLineChange cterm=bold ctermbg=NONE ctermfg=yellow',
            \ 'highlight SignifySignAdd    cterm=bold ctermbg=NONE ctermfg=green',
            \ 'highlight SignifySignDelete cterm=bold ctermbg=NONE ctermfg=red',
            \ 'highlight SignifySignChange cterm=bold ctermbg=NONE ctermfg=yellow',
            \ 'highlight SignColumn        ctermbg=NONE',
            \ 'highlight CursorLine        ctermbg=NONE cterm=underline',
            \ 'highlight Folded            ctermbg=NONE cterm=bold',
            \ 'highlight FoldColumn        ctermbg=NONE cterm=bold',
            \ 'highlight NonText           ctermbg=NONE',
            \ 'highlight clear LineNr'
            \]

" Limelight conceal
let g:limelight_conceal_ctermfg=0xa

" Indent char
let g:indentLine_char = ''
let g:indentLine_color_term = 245

"Translucent background
hi Normal     guibg=NONE
hi NonText    guibg=NONE
hi LineNr     guibg=NONE
hi SignColumn guibg=NONE

hi VertSplit ctermbg=NONE ctermfg=NONE
           \ guibg=NONE

hi Comment ctermfg=blue guifg=#8b80b0
hi SpecialComment ctermfg=blue guifg=#8b80b0


" Use GUI colors on terminal
set termguicolors
