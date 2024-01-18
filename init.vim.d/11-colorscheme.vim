" Molokai color

function SetColor()

    if system('zsh -ic _get_theme') =~ 'light' " Rely on zsh script for dark/light
        set background=light
        colorscheme garden

        hi NonText guifg=#aaaaaa
        hi DiffText guibg=#ffdc87
        hi DiffAdd guibg=#afffb4
        hi TreesitterContextLineNumber guibg=#ebebae
    else
        colorscheme moody

        hi NonText guifg=#6f6f6f
        hi DiffText guibg=#644100
        hi DiffAdd guibg=#1e5005
        hi TreesitterContextLineNumber guibg=#535353
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

" Hook fwatch for theme updates
lua <<EOF
require'fwatch'.watch(os.getenv("XDG_RUNTIME_DIR") .. "/theme",
    { on_event =
        function()
            vim.defer_fn(vim.fn.SetColor, 10)
        end
    })
EOF
