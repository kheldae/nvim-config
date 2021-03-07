" Molokai color
if $TERM == "xterm-kitty" && system('cat $XDG_RUNTIME_DIR/theme') =~ "light"
    set background="light"
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
let g:indentLine_char = ""
let g:indentLine_color_term = 245

" Semantic colors
let g:semanticTermColors = [202,203,208,209,196,172,173,178,136,9,160,214,215,216,166,142,144,220,221,222]

hi VertSplit ctermbg=NONE ctermfg=NONE

hi Comment ctermfg=blue
hi SpecialComment ctermfg=blue
