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

if v:progname == "goyo" || exists("g:startGoyo")
    runtime! goyo.vim
elseif ! exists("g:configLoaded")
    set guifont="Fira Code:h10"

    " Note: The line below loads all files in the "init.vim.d" directory.
    runtime! init.vim.d/*.vim
    runtime! init.vim.d/*.lua

    let g:configLoaded = 1
endif
"all your base are belong to vim" -- Karl van der Vim, 2018
