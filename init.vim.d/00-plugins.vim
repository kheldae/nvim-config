"
" Vundle plugins install
"

set nocompatible              " be iMproved, required
set expandtab
set tabstop=4
set shiftwidth=4

filetype off                  " required

" set the runtime path to include Vim-Plug and initialize
call plug#begin('~/.config/nvim/bundle')

" Vim-Plug auto-updater
Plug 'junegunn/vim-plug'

" Color scheme
Plug 'kamykn/skyknight'
Plug 'jakwings/vim-colors'

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Git commands
Plug 'tpope/vim-fugitive'

" Statusline that's light as the thin air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" and put the line on tmux as well
Plug 'edkolev/tmuxline.vim'

" Floating box for search stuff
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/searchbox.nvim'

" Support for Rust
Plug 'mattn/webapi-vim'
Plug 'rust-lang/rust.vim'

" Fabulous contextual complete system
Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'
Plug 'kevinhwang91/nvim-bqf'

" Deoplete providers
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'zchee/deoplete-zsh'
Plug 'vim-scripts/dbext.vim'

" GDB thin wrapper
Plug 'sakhnik/nvim-gdb'

" Language linter
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'folke/trouble.nvim'

" Color for LSP warnings
Plug 'folke/lsp-colors.nvim'

" Communication with Sourcetrail
Plug 'CoatiSoftware/vim-sourcetrail'

" File tree (and Git plugin)
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Start screen
Plug 'mhinz/vim-startify'

" Tag bar for navigating data types
Plug 'liuchengxu/vista.vim'

" Snippets manager
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ASCII art and diagrams
Plug 'vim-scripts/DrawIt'

" The Silver Searcher integration
Plug 'gabesoft/vim-ags'

" HTTP request syntax and executor
Plug 'nicwest/vim-http'

" LaTeX support
Plug 'vim-latex/vim-latex'

" Non-plain text document decoder
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" CSV editor
Plug 'chrisbra/csv.vim'

" Database access
Plug 'tpope/vim-dadbod'

" Cucumber/Gherkin syntax
Plug 'tpope/vim-cucumber'

" Nix config syntax
Plug 'LnL7/vim-nix'

" Oz language syntax
Plug 'vim-scripts/oz.vim'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Edit file as root
Plug 'lambdalisue/suda.vim'

" Indent lines
Plug 'Yggdroot/indentLine'

" Syntax for LOLCODE
Plug 'justinmeza/lolcode.vim'

" Syntax for Brainfuck
Plug 'vim-scripts/brainfuck-syntax'

" Syntax for Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'

" Syntax for GNU assembler
Plug 'Shirk/vim-gas'

" Syntax for ACME C64 assembler
Plug 'leissa/vim-acme'

" Add multiple cursors
Plug 'mg979/vim-visual-multi'

" PostgreSQL integration
Plug 'martingms/vipsql'

" CMake commands
Plug 'vhdirk/vim-cmake'

" Support for ZetZ formally provable C transpiler
Plug 'zetzit/vim'

" Support for JSonnet
Plug 'google/vim-jsonnet'

" Support for Dhall
Plug 'vmchale/dhall-vim'

" Support for y86 assembly
Plug 'wilt00/vim-y86-syntax'

" Support for gcov files
Plug 'm42e/vim-gcov-marker'

" Icons on NERDTree (and others)
Plug 'ryanoasis/vim-devicons'

" Fold with markers AND syntax
Plug 'Jorengarenar/vim-syntaxMarkerFold'

" Discord rich presence because fuck you VScode, vim can do it too :P
Plug 'vimsence/vimsence'

call plug#end()
filetype plugin indent on


