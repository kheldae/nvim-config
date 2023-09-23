" Molokai color

function SetColor()

    if system('zsh -ic _get_theme') =~ 'light' " Rely on zsh script for dark/light
        set background=light
        colorscheme garden

        hi DiffText guibg=#ffdc87
        hi DiffAdd guibg=#afffb4
    else
        colorscheme moody

        hi DiffText guibg=#644100
        hi DiffAdd guibg=#1e5005
    endif

    " Limelight conceal
    let g:limelight_conceal_ctermfg=0xa

    " Translucent background
    hi Normal     guibg=NONE
    hi NonText    guibg=NONE
    hi LineNr     guibg=NONE
    hi SignColumn guibg=NONE
    hi EndOfBuffer guibg=NONE

    hi VertSplit ctermbg=NONE ctermfg=NONE
               \ guibg=NONE

    hi Comment ctermfg=blue guifg=#8b80b0        cterm=italic gui=italic
    hi SpecialComment ctermfg=blue guifg=#8b80b0 cterm=italic gui=italic

    sign define DiagnosticSignError     text=   texthl=DiagnosticSignError
    sign define DiagnosticSignWarn      text=   texthl=DiagnosticSignWarn
    sign define DiagnosticSignHint      text=   texthl=DiagnosticSignHint
    sign define DiagnosticSignInfo      text=   texthl=DiagnosticSignInfo
    sign define DiagnosticSignOther     text=   texthl=DiagnosticSignOther

endfunction

call SetColor()

" Use GUI colors on terminal
set termguicolors
