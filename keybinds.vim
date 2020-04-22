" Set leader to bang
let mapleader = "!"

nnoremap bn :bn<CR>
nnoremap bv :bp<CR>
nnoremap bd :bd<CR>

nnoremap ty :tabnext<CR>
nnoremap tr :tabprev<CR>
nnoremap tn :tabnew<CR>

nnoremap <leader>la :set nornu<CR>
nnoremap <leader>lr :set rnu<CR>

nnoremap <leader>fr :NERDTreeRefreshRoot<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>

nnoremap <leader>at :ALEToggleBuffer<CR>

nnoremap <leader>tt :TagbarToggle<CR>

nnoremap <leader>td :Ags TODO<CR>

nnoremap <leader>st :SemanticHighlightToggle<CR>

nnoremap <leader>sst :SourcetrailStartServer<CR>
nnoremap <leader>sss :SourcetrailActivateToken<CR>
nnoremap <leader>ssr :SourcetrailRefresh<CR>

nnoremap <leader><left> <C-W><C-H>
nnoremap <leader><right> <C-W><C-L>
nnoremap <leader><up> <C-W><C-K>
nnoremap <leader><down> <C-W><C-J>

inoremap jk <ESC>
