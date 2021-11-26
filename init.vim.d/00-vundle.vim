"
" Vundle plugins install
"

set nocompatible              " be iMproved, required
set expandtab
set tabstop=4
set shiftwidth=4

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" Vundle auto-updater
Plugin 'VundleVim/Vundle.vim'

" Color scheme
Plugin 'kamykn/skyknight'
Plugin 'jakwings/vim-colors'

" Distraction-free writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Git commands
Plugin 'tpope/vim-fugitive'

" Statusline that's light as the thin air
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" and put the line on tmux as well
Plugin 'edkolev/tmuxline.vim'

" Floating box for search stuff
Plugin 'MunifTanjim/nui.nvim'
Plugin 'VonHeikemen/searchbox.nvim'

" Support for Rust
Plugin 'mattn/webapi-vim'
Plugin 'rust-lang/rust.vim'

" Fabulous contextual complete system
Plugin 'Shougo/deoplete.nvim'
Plugin 'ncm2/float-preview.nvim'
Plugin 'kevinhwang91/nvim-bqf'

" Deoplete providers
Plugin 'deoplete-plugins/deoplete-lsp'
Plugin 'zchee/deoplete-zsh'
Plugin 'vim-scripts/dbext.vim'

" Language linter
Plugin 'neovim/nvim-lspconfig'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'RishabhRD/popfix'
Plugin 'RishabhRD/nvim-lsputils'

" Color for LSP warnings
Plugin 'folke/lsp-colors.nvim'

" Communication with Sourcetrail
Plugin 'CoatiSoftware/vim-sourcetrail'

" File tree (and Git plugin)
Plugin 'kyazdani42/nvim-tree.lua'
Plugin 'kyazdani42/nvim-web-devicons'

" Start screen
Plugin 'mhinz/vim-startify'

" Tag bar for navigating data types
Plugin 'liuchengxu/vista.vim'

" Snippets manager
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" ASCII art and diagrams
Plugin 'vim-scripts/DrawIt'

" The Silver Searcher integration
Plugin 'gabesoft/vim-ags'

" HTTP request syntax and executor
Plugin 'nicwest/vim-http'

" LaTeX support
Plugin 'vim-latex/vim-latex'

" Non-plain text document decoder
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

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

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Edit file as root
Plugin 'lambdalisue/suda.vim'

" Indent lines
Plugin 'Yggdroot/indentLine'

" Syntax for LOLCODE
Plugin 'justinmeza/lolcode.vim'

" Syntax for Brainfuck
Plugin 'vim-scripts/brainfuck-syntax'

" Syntax for Jinja2
Plugin 'Glench/Vim-Jinja2-Syntax'

" Syntax for GNU assembler
Plugin 'Shirk/vim-gas'

" Add multiple cursors
Plugin 'mg979/vim-visual-multi'

" PostgreSQL integration
Plugin 'martingms/vipsql'

" CMake commands
Plugin 'vhdirk/vim-cmake'

" Support for ZetZ formally provable C transpiler
Plugin 'zetzit/vim'

" Support for JSonnet
Plugin 'google/vim-jsonnet'

" Support for Dhall
Plugin 'vmchale/dhall-vim'

" Support for gcov files
Plugin 'm42e/vim-gcov-marker'

" Icons on NERDTree (and others)
Plugin 'ryanoasis/vim-devicons'

" Fold with markers AND syntax
Plugin 'Jorengarenar/vim-syntaxMarkerFold'

" Discord rich presence because fuck you VScode, vim can do it too :P
Plugin 'vimsence/vimsence'

call vundle#end()
filetype plugin indent on


