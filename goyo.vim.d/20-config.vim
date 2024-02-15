set nofoldenable
set nolist

" Enable Coq completion engine
let g:coq_settings = { 'auto_start': 'shut-up' }

function SetGoyoColor()

    hi Normal       guibg=NONE ctermbg=NONE
    hi StatusLine   guibg=NONE ctermbg=NONE
    hi StatusLineNC guibg=NONE ctermbg=NONE
    hi VertSplit    guibg=NONE ctermbg=NONE

    silent! sh -c 'sleep 1; kitty @ set-background-opacity 1'

endfunction

call SetGoyoColor()

lua <<EOF
require'fwatch'.watch(os.getenv("XDG_RUNTIME_DIR") .. "/theme",
    { on_event =
        function()
            vim.defer_fn(vim.fn.SetGoyoColor, 10)
        end
    })
EOF

" set limelight conceal
let g:limelight_conceal_ctermfg=0xa

" Make goyo a bit wider
let g:goyo_width=100

let g:startify_disable_at_vimenter=1

let g:copilot_enabled = 0

autocmd vimenter * Goyo

