set title

filetype plugin on
syntax on
set mouse=a
set number
set linebreak
set breakindent
set breakindentopt=shift:2

set autoread

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=2
set conceallevel=3

set completeopt-=preview

set list
set listchars=tab:⇥\ ,trail:␣,nbsp:⍽

set fillchars=eob:\ ,vert:│,fold:,foldclose:,foldopen:,foldsep:░
