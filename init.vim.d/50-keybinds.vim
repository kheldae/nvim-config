" Set leader to bang
let mapleader = "!"

nnoremap bn :bn<CR>
nnoremap bv :bp<CR>
nnoremap bd :bn<bar>:bd#<CR>

nnoremap ty :tabnext<CR>
nnoremap tr :tabprev<CR>
nnoremap tn :tabnew<CR>

nnoremap <leader>la :set nornu<CR>
nnoremap <leader>lr :set rnu<CR>

nnoremap <leader>op :PickColor<CR>

nnoremap <leader>cD :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>cd :lua vim.lsp.buf.definition()<CR>
"        (shift + *)
nnoremap µ          :lua vim.lsp.buf.references()<CR>
nnoremap <leader>ci :lua vim.lsp.buf.implementation()<CR>
nnoremap ?          :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>?  :CodeActionMenu<CR>
nnoremap <leader>mv :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>c<left>    :lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <leader>c<right>   :lua vim.lsp.buf.outgoing_calls()<CR>
nnoremap <leader>cf :lua vim.lsp.buf.format()<CR>
nnoremap <leader>!  :TroubleToggle workspace_diagnostics<CR>

nnoremap /          :lua require"searchbox".incsearch()<CR>

nnoremap <leader>fr :NvimTreeRefresh<CR>
nnoremap <leader>ft :NvimTreeToggle<CR>

nnoremap <leader>tt :Vista<CR>

nnoremap <leader>td :Ags TODO<CR>

nnoremap <leader>st :SourcetrailStartServer<CR>
nnoremap <leader>ss :SourcetrailActivateToken<CR>
nnoremap <leader>sr :SourcetrailRefresh<CR>

nnoremap <leader>po :VipsqlOpenSession<CR>
nnoremap <leader>pi :VipsqlSend input("Command? ")<CR>
nnoremap <leader>pw :VipsqlSendBuffer<CR>

nnoremap <leader>hw :Http<CR>

nnoremap <leader>db :lua require"dap".toggle_breakpoint()<CR>
nnoremap <leader>dc :lua require"dap".continue()<CR>
nnoremap <leader>dn :lua require"dap".step_over()<CR>
nnoremap <leader>ds :lua require"dap".step_into()<CR>
nnoremap <leader>dF :lua require"dap.ui.widgets".centered_float(require"dap.ui.widgets".frames)<CR>
nnoremap <leader>dS :lua require"dap.ui.widgets".centered_float(require"dap.ui.widgets".scopes)<CR>
nnoremap <leader>d? :lua require"dap.ui.widgets".hover()<CR>

nnoremap <leader>go :GitConflictChooseOurs<CR>
nnoremap <leader>gt :GitConflictChooseTheirs<CR>
nnoremap <leader>gn :GitConflictChooseNone<CR>
nnoremap <leader>ga :GitConflictChooseBoth<CR>

nnoremap <leader>q  :lua require"notify".dismiss()<CR>

nnoremap <leader><left> <C-W><C-H>
nnoremap <leader><right> <C-W><C-L>
nnoremap <leader><up> <C-W><C-K>
nnoremap <leader><down> <C-W><C-J>

inoremap jk <ESC>
tnoremap jk <C-\><C-n>.<ESC>
