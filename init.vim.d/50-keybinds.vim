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

nnoremap <leader>cD :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>cd :lua vim.lsp.buf.definition()<CR>
nnoremap µ          :lua vim.lsp.buf.references()<CR>
nnoremap <leader>ci :lua vim.lsp.buf.implementation()<CR>
nnoremap ?          :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>?  :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>mv :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>c<left>    :lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <leader>c<right>   :lua vim.lsp.buf.outgoing_calls()<CR>

nnoremap <leader>fr :NERDTreeRefreshRoot<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>

nnoremap <leader>tt :Vista<CR>

nnoremap <leader>td :Ags TODO<CR>

nnoremap <leader>st :SemanticHighlightToggle<CR>

nnoremap <leader>sst :SourcetrailStartServer<CR>
nnoremap <leader>sss :SourcetrailActivateToken<CR>
nnoremap <leader>ssr :SourcetrailRefresh<CR>

nnoremap <leader>po :VipsqlOpenSession<CR>
nnoremap <leader>pi :VipsqlSend input("Command? ")<CR>
nnoremap <leader>pw :VipsqlSendBuffer<CR>

nnoremap <leader>hw :Http<CR>

nnoremap <leader><left> <C-W><C-H>
nnoremap <leader><right> <C-W><C-L>
nnoremap <leader><up> <C-W><C-K>
nnoremap <leader><down> <C-W><C-J>

inoremap jk <ESC>
