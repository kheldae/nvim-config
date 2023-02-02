" Molokai color

function SetColor()

    if system('zsh -ic _get_theme') =~ 'light' " Rely on zsh script for dark/light
        set background=light
        colorscheme garden
    else
        colorscheme moody
    endif

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
    hi EndOfBuffer guibg=NONE

    hi VertSplit ctermbg=NONE ctermfg=NONE
               \ guibg=NONE

    hi Comment ctermfg=blue guifg=#8b80b0        cterm=italic gui=italic
    hi SpecialComment ctermfg=blue guifg=#8b80b0 cterm=italic gui=italic

endfunction

call SetColor()

" Use GUI colors on terminal
set termguicolors
