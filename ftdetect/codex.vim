" Vim filetype plugin file
" Language:     Rune Codex assembly
" Maintainer:   Karim Vergnes <me@thesola.io>

augroup vim-codex-filetype
    autocmd!
    au BufRead,BufNewFile *.cx,*.codex set filetype=codex
augroup END
