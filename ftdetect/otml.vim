" File: otml.vim
" Author: Karim Vergnes
" License: Private
" Description:
"       Binds OTML header to the OTML language definition.
"

au! BufNewFile,BufRead * if getline(1) =~ '^%OTML' || getline(2) =~ '^%OTML' | setf otml | endif
