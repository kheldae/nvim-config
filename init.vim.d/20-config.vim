" Deoplete config
let g:deoplete#sources#rust#racer_binary = system('which racer')
let g:deoplete#sources#rust#rust_source_path = '/usr/local/src/rust/src'
let g:deoplete#enable_at_startup = 1

let g:csv_autocmd_arrange=1

" Set location of libclang for Deoplete
let g:clang_library_path="/lib/libclang.so"
" and tell clang to use its default keymaps
let g:clang_make_default_keymappings=1

" ALE Linter settings
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_balloons = 1

let g:ale_c_parse_makefile = 1
let g:ale_cpp_parse_makefile = 1

" Deoplete preview
let g:float_preview#docked = 0

" Rust Playpen clipboard command
let g:rust_clip_command = 'xclip -selection clipboard'

" DevIcons settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableNERDTreeRedraw = 0

" Small windows don't need NERDTree
if &columns > 100
    autocmd VimEnter * NERDTree
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

