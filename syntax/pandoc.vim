syn match todoCheckbox "\v\s*- \[\ \]" conceal cchar=
syn match todoCheckbox "\v\s*- \[x\]" conceal cchar=

hi def link todoCheckbox Todo
