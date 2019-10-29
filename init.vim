"                                 ..
"                               .::::.
"                  ___________ :;;;;:`____________
"                  \_________/ ?????L \__________/
"                    |.....| ????????> :.......'
"                    |:::::| $$$$$$"`.:::::::' ,
"                   ,|:::::| $$$$"`.:::::::' .OOS.
"                 ,7D|;;;;;| $$"`.;;;;;;;' .OOO888S.
"               .GDDD|;;;;;| ?`.;;;;;;;' .OO8DDDDDNNS.
"                'DDO|IIIII| .7IIIII7' .DDDDDDDDNNNF`
"                  'D|IIIIII7IIIII7' .DDDDDDDDNNNF`
"                    |EEEEEEEEEE7' .DDDDDDDNNNNF`
"                    |EEEEEEEEZ' .DDDDDDDDNNNF`
"                    |888888Z' .DDDDDDDDNNNF`
"                    |8888Z' ,DDDDDDDNNNNF`
"                    |88Z'    "DNNNNNNN"
"                    '"'        "MMMM"
"
"                    ALL HAIL THE VIM MASTER RACE

set nocompatible              " be iMproved, required
set expandtab
set tabstop=4
set shiftwidth=4

"set term=builtin_xterm
set title

filetype off                  " required

let g:powerline_pycmd="py3"

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" Vundle auto-updater
Plugin 'VundleVim/Vundle.vim'

" Color scheme
Plugin 'kamykn/skyknight'
Plugin 'godlygeek/csapprox'

" Distraction-free writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Git commands
Plugin 'tpope/vim-fugitive'

" Statusline that's light as the thin air
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Fabulous contextual complete system
Plugin 'Shougo/deoplete.nvim'

" Deoplete providers
Plugin 'Rip-Rip/clang_complete'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'zchee/deoplete-jedi'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'Shougo/neco-vim'
Plugin 'zchee/deoplete-zsh'

" Language linter
Plugin 'w0rp/ale'

" File tree (and Git plugin)
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Tag bar for navigating data types
Plugin 'majutsushi/tagbar'

" Snippets manager
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" LaTeX support
Plugin 'vim-latex/vim-latex'

" Non-plain text document decoder
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" GDB for Neovim
Plugin 'huawenyu/neogdb.vim'

" Lisp environment
Plugin 'kovisoft/slimv'

" CSV editor
Plugin 'chrisbra/csv.vim'

" Database access
Plugin 'tpope/vim-dadbod'

" Cucumber/Gherkin syntax
Plugin 'tpope/vim-cucumber'

" Nix config syntax
Plugin 'LnL7/vim-nix'

" Oz language syntax
Plugin 'vim-scripts/oz.vim'

" Haskell language support
Plugin 'bitc/vim-hdevtools'

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Arduino compatibility (Vim > AIDE)
Plugin 'stevearc/vim-arduino'

" Edit file as root
Plugin 'lambdalisue/suda.vim'

" Indent lines
Plugin 'Yggdroot/indentLine'

" Syntax for TOML
Plugin 'cespare/vim-toml'

" Syntax for LOLCODE
Plugin 'justinmeza/lolcode.vim'

" Syntax for Brainfuck
Plugin 'vim-scripts/brainfuck-syntax'

" Syntax for Jinja2
Plugin 'Glench/Vim-Jinja2-Syntax'

" Support for Rust
Plugin 'mattn/webapi-vim'
Plugin 'rust-lang/rust.vim'

" Add multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" CMake commands
Plugin 'vhdirk/vim-cmake'

" Support for gcov files
Plugin 'm42e/vim-gcov-marker'

" Icons on NERDTree (and others)
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on

syntax on
set mouse=a
set number
set linebreak
set breakindent
set breakindentopt=shift:2

" Molokai color
colorscheme skyknight

let g:deoplete#enable_at_startup = 1
let g:airline_theme='molokai'

" Airline separators
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter= 'default'

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

let g:csv_autocmd_arrange=1

" Set location of libclang for Deoplete
let g:clang_library_path="/lib/libclang.so"
" and tell clang to use its default keymaps
let g:clang_make_default_keymappings=1

source ~/.config/nvim/keybinds.vim

set foldmethod=syntax
set foldlevel=2

" Limelight conceal
let g:limelight_conceal_ctermfg=0xa

" ALE Linter settings
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_lint_on_text_changed = 'never'

" Rust Playpen clipboard command
let g:rust_clip_command = 'xclip -selection clipboard'

" DevIcons settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableNERDTreeRedraw = 0

" Indent char
let g:indentLine_char = ""
let g:indentLine_color_term = 245

" Suda prefix
let g:suda#prefix = 'sudo:'

set fillchars=vert:│
hi VertSplit ctermbg=NONE ctermfg=NONE

hi Comment ctermfg=blue
hi SpecialComment ctermfg=blue

" Small windows don't need NERDTree
if &columns > 100
    autocmd VimEnter * NERDTree
endif

" Shortcut to call Haskell REPL on current file
command Prelude term ghci %

"all your base are belong to vim" -- Karl van der Vim, 2018
