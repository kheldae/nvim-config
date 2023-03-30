"
" Vim-plug plugins install
"

set nocompatible              " be iMproved, required
set expandtab
set tabstop=4
set shiftwidth=4

" set the runtime path to include Vim-Plug and initialize
call plug#begin(stdpath('config').'/bundle')

" Vim-Plug auto-updater
Plug 'junegunn/vim-plug'

" Color scheme
Plug 'jakwings/vim-colors'

" File listener for color scheme changer
Plug 'rktjmp/fwatch.nvim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Statusline that's light as the thin air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" and put the line on tmux as well
Plug 'edkolev/tmuxline.vim'

" Floating box for search stuff
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/searchbox.nvim'

" Support for Rust
Plug 'mattn/webapi-vim',        { 'for': 'rust' }
Plug 'rust-lang/rust.vim',      { 'for': 'rust' }

" Fancy notifications system
Plug 'rcarriga/nvim-notify'

" Fabulous contextual complete system
Plug 'ncm2/float-preview.nvim'
Plug 'kevinhwang91/nvim-bqf'

" GitHub Copilot integration
Plug 'github/copilot.vim',      { 'on': 'Copilot' }

" Language linter
Plug 'mfussenegger/nvim-dap'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim',         { 'do': ':COQdeps' }
Plug 'ms-jpq/coq.thirdparty'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'folke/trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Color for LSP warnings
Plug 'folke/lsp-colors.nvim'

" Debugging JDTls extension
Plug 'mfussenegger/nvim-jdtls'

" Communication with Sourcetrail
Plug 'CoatiSoftware/vim-sourcetrail', { 'on': ['SourcetrailRefresh','SourcetrailStartServer'] }

" File tree (and Git plugin)
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Start screen
Plug 'mhinz/vim-startify'

" Tag bar for navigating data types
Plug 'liuchengxu/vista.vim'

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

" Git integration
Plug 'nvim-lua/plenary.nvim'
Plug 'tanvirtin/vgit.nvim'

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

" Support for ZetZ formally provable C transpiler
Plug 'zetzit/vim'

" Support for Ragel state machine language
Plug 'jneen/ragel.vim'

" Support for JSonnet
Plug 'google/vim-jsonnet'

" Support for Dhall
Plug 'vmchale/dhall-vim'

" Support for Nickel
Plug 'nickel-lang/vim-nickel'

" Support for PureScript
Plug 'purescript-contrib/purescript-vim'

" Support for Coq formal proof language
Plug 'whonore/Coqtail'
Plug 'tomtomjhj/coq-lsp.nvim'

" Support for SBVR English
Plug 'xginn8/SBVR.vim'

" Support for y86 assembly
Plug 'wilt00/vim-y86-syntax'

" Support for gcov files
Plug 'm42e/vim-gcov-marker'

" Support for Apple PList
Plug 'darfink/vim-plist'

" Support for Menhir (yacc in OCaML)
Plug 'ELLIOTTCABLE/vim-menhir'

" Support for OpenCL language
Plug 'petRUShka/vim-opencl'

" Support for ACPI ASL language
Plug 'martinlroth/vim-acpi-asl'

" Icons on NERDTree (and others)
Plug 'ryanoasis/vim-devicons'

" Fold with markers AND syntax
Plug 'Jorengarenar/vim-syntaxMarkerFold'

" Displays offscreen context for current line
Plug 'wellle/context.vim'

" Preview and pick hex and CSS format colors
Plug 'ziontee113/color-picker.nvim'

" Discord rich presence because fuck you VScode, vim can do it too :P
Plug 'andweeb/presence.nvim'

" Write raw ANSI codes to recreate color buffer
Plug 'ofavre/vimcat', { 'rtp': 'runtime' }

call plug#end()

