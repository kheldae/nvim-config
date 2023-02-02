" Enable Coq completion engine
let g:coq_settings = { 'auto_start': 'shut-up' }

let g:csv_autocmd_arrange=1

" Tell Vista to use LSP by default
let g:vista_default_executive='nvim_lsp'

" Discord Presence
let g:vimsence_small_text = 'Neovim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing {}'
let g:vimsence_editing_state = 'Project: {}'
let g:vimsence_file_explorer_text = 'Stuck in file sidebar'
let g:vimsence_file_explorer_details = '(Neovim is an IDE too)'

" Deoplete preview
let g:float_preview#docked = 0

" DevIcons settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableNERDTreeRedraw = 0

" GitHub Copilot Node command
if isdirectory('/nix')
    let g:copilot_node_command = ['nix', '--extra-experimental-features', 'nix-command flakes', 'run', 'nixpkgs#nodejs-16_x', '--']
endif

" Disable Copilot by default
let g:copilot_enabled = 0

" Set PList editor settings
let g:plist_display_format = 'json'

" Disable Unicode conceal from PureScript syntax
let g:purescript_unicode_conceal_enable = 0

" Fix for idiotic VGit "optimization"
set signcolumn=yes

" Manually invoke Startify when auto-tree on empty buffer
function StartAndTree()
    if !argc()
        Startify
    endif
    NvimTreeOpen
    wincmd w
endfunction

autocmd VimEnter *
    \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \ |   PlugInstall --sync | q
    \ | endif

" Small windows don't need NvimTree
if &columns > 100
    autocmd VimEnter * 
        \ call StartAndTree()
    autocmd BufEnter *
        \ ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr()
        \ |   quit
        \ | endif
endif
