" Custom colorscheme definition, needs to be splitted around the 'if' to make
" sure to be able to hotswap the colorscheme correctly.
function SetColor()

    if system('zsh -ic _get_theme') =~ 'light' " Rely on zsh script for dark/light
        set background=light
        colorscheme daedrim

        hi NonText                      guifg=#aaaaaa
        hi DiffText                     guibg=#ffdc87
        hi DiffAdd                      guibg=#afffb4
        hi TreesitterContextLineNumber  guibg=#ebebae
        hi TabLineFill                  guibg=#9bb9de
        hi TabLineSel                   guifg=#000000
    else
        colorscheme daeser

        hi NonText                      guifg=#6f6f6f
        hi DiffText                     guibg=#644100
        hi DiffAdd                      guibg=#1e5005
        hi TreesitterContextLineNumber  guibg=#535353
        hi TabLineFill                  guibg=#292b2f
        hi TabLineSel                   guifg=#292b2f
        hi BufferCurrentMod             guifg=#ffffff
        hi BufferDefaultCurrentMod      guifg=#ffffff
    endif

    " Limelight conceal
    let g:limelight_conceal_ctermfg=0xa

    " Translucent background
    hi Normal     guibg=NONE
    hi NonText    guibg=NONE
    hi LineNr     guibg=NONE
    hi SignColumn guibg=NONE
    hi EndOfBuffer guibg=NONE

    " Translucent BarBar
    hi TabLine guibg=#303030 guifg=#ffffff
    hi TabLineSel guibg=#918154
    "hi TabLineFill guibg=NONE
    hi BufferDefaultCurrent guibg=NONE
    hi BufferDefaultCurrentIcon guibg=NONE
    hi BufferDefaultCurrentSign guibg=NONE

    hi BufferCurrent        guibg=NONE
    hi BufferCurrentMod     guibg=#918154
    hi BufferCurrentIcon    guibg=NONE
    hi BufferCurrentSign    guibg=NONE

    " LuaBar translucent ends
    hi StatusLine guibg=NONE
    hi StatusLineNC guibg=NONE

    hi VertSplit ctermbg=NONE ctermfg=NONE
               \ guibg=NONE

    hi Comment ctermfg=blue guifg=#8b80b0        cterm=italic gui=italic
    hi SpecialComment ctermfg=blue guifg=#8b80b0 cterm=italic gui=italic

    hi! link LspCxxHlGroupMemberVariable @lsp.type.property

    sign define DiagnosticSignError     text=   texthl=DiagnosticSignError
    sign define DiagnosticSignWarn      text=   texthl=DiagnosticSignWarn
    sign define DiagnosticSignHint      text=   texthl=DiagnosticSignHint
    sign define DiagnosticSignInfo      text=   texthl=DiagnosticSignInfo
    sign define DiagnosticSignOther     text=   texthl=DiagnosticSignOther

endfunction

call SetColor()

" Use GUI colors on terminal
set termguicolors
