let g:airline_theme='molokai'

" Airline separators
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter= 'default'
let g:airline#extensions#ale#enabled = 1

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '\'

let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''

let g:tmuxline_separators = {
    \ 'right': '',
    \ 'right_alt': '',
    \ 'left': '',
    \ 'left_alt': '',
    \ 'space': ' ' }

" Generate airline config dump
autocmd VimEnter * silent! TmuxlineSnapshot ~/.tmux-airline.conf
