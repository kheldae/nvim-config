" The Vim-Goyo config.

if ! exists("g:configLoaded")
    " Note: The line below loads all files in the "goyo.vim.d" directory.
    runtime! goyo.vim.d/*.vim
    runtime! goyo.vim.d/*.lua

    let g:configLoaded = 1
endif

" vim:ft=vim
