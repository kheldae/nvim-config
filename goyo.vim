" The Vim-Goyo config.

set nocompatible              " be iMproved, required
set expandtab
set tabstop=4
set shiftwidth=4

"set term=builtin_xterm
set title

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" Vundle auto-updater
Plugin 'VundleVim/Vundle.vim'

" Install Goyo (the whole point)
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" LaTeX support
Plugin 'vim-latex/vim-latex'

" Non-plain text document decoder
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Edit file as root
Plugin 'vim-scripts/sudo.vim'

call vundle#end()

filetype plugin indent on

syntax on
set mouse=a
set number
set linebreak
set breakindent
set breakindentopt=shift:2

" My custom color scheme
colorscheme sol

" set limelight conceal
let g:limelight_conceal_ctermfg=0xa

source ~/.config/nvim/keybinds.vim

set foldmethod=syntax
set foldlevel=2

autocmd vimenter * Goyo

" vim:ft=vim
