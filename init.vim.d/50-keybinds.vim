" Set leader to bang
let mapleader = "!"

nnoremap <silent> bn :BufferNext<CR>
nnoremap <silent> bv :BufferPrevious<CR>
nnoremap <silent> bN :BufferMoveNext<CR>
nnoremap <silent> bV :BufferMovePrevious<CR>
nnoremap <silent> bd :BufferClose<CR>

nnoremap <silent> ty :tabnext<CR>
nnoremap <silent> tr :tabprev<CR>
nnoremap <silent> tn :tabnew<CR>

nnoremap <silent> <leader>la :set nornu<CR>
nnoremap <silent> <leader>lr :set rnu<CR>

nnoremap <silent> <leader>op :PickColor<CR>

nnoremap <silent> <leader>cD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>cd :lua vim.lsp.buf.definition()<CR>
"        <silent> (shift + *)
nnoremap <silent> µ          :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>ci :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ?          :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>?  :CodeActionMenu<CR>
nnoremap <silent> <leader>mv :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>c<left>    :lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> <leader>c<right>   :lua vim.lsp.buf.outgoing_calls()<CR>
nnoremap <silent> <leader>cf :lua vim.lsp.buf.format()<CR>
nnoremap <silent> <leader>!  :TroubleToggle workspace_diagnostics<CR>

nnoremap <silent> <leader>fr :NvimTreeRefresh<CR>
nnoremap <silent> <leader>ft :NvimTreeToggle<CR>

nnoremap <silent> <leader>tt :Vista<CR>

nnoremap <silent> <leader>td :Ags TODO<CR>

nnoremap <silent> <leader>st :SourcetrailStartServer<CR>
nnoremap <silent> <leader>ss :SourcetrailActivateToken<CR>
nnoremap <silent> <leader>sr :SourcetrailRefresh<CR>

nnoremap <silent> <leader>po :VipsqlOpenSession<CR>
nnoremap <silent> <leader>pi :VipsqlSend input("Command? ")<CR>
nnoremap <silent> <leader>pw :VipsqlSendBuffer<CR>

nnoremap <silent> <leader>hw :Http<CR>

nnoremap <silent> <leader>db :lua require"dap".toggle_breakpoint()<CR>
nnoremap <silent> <leader>dc :lua require"dap".continue()<CR>
nnoremap <silent> <leader>dn :lua require"dap".step_over()<CR>
nnoremap <silent> <leader>ds :lua require"dap".step_into()<CR>
nnoremap <silent> <leader>dF :lua require"dap.ui.widgets".centered_float(require"dap.ui.widgets".frames)<CR>
nnoremap <silent> <leader>dS :lua require"dap.ui.widgets".centered_float(require"dap.ui.widgets".scopes)<CR>
nnoremap <silent> <leader>d? :lua require"dap.ui.widgets".hover()<CR>

nnoremap <silent> <leader>go :GitConflictChooseOurs<CR>
nnoremap <silent> <leader>gt :GitConflictChooseTheirs<CR>
nnoremap <silent> <leader>gn :GitConflictChooseNone<CR>
nnoremap <silent> <leader>ga :GitConflictChooseBoth<CR>

nnoremap <silent> <leader>q  :lua require"notify".dismiss()<CR>

nnoremap <leader><left> <C-W><C-H>
nnoremap <leader><right> <C-W><C-L>
nnoremap <leader><up> <C-W><C-K>
nnoremap <leader><down> <C-W><C-J>

inoremap jk <ESC>
tnoremap jk <C-\><C-n>
