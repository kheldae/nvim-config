" File: appmf.vim
" Author: Karim Vergnes
" License: Private
" Description:
"       Binds appmf file extension and header to the appmf syntax (modified YAML)
"

au! BufNewFile,BufRead *.appmf if getline(1) =~ '^%AppMF' | setf appmf | endif
