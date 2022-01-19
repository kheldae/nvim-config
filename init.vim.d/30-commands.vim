" Shortcut to call Haskell REPL on current file
command GHCi bot split | term ghci %

" Shortcut to call Jupyter console
command -nargs=1 I call JupyterConsole(<f-args>)

function JupyterConsole(kernel)
    let jupyCommand = 'jupyter console --kernel '.a:kernel
    bot split
    execute "term" l:jupyCommand
endfunction

" LSP integration
command LFormat     lua vim.lsp.buf.formatting()
command LActions    lua vim.lsp.buf.code_action()
command LPrefetch   lua nixsh_prefetch()


let g:_laf_next_state=1
" Toggle formatting upon exiting Insert mode
command LAutoFormatEnable   call SetLAutoFormat(1)
command LAutoFormatDisable  call SetLAutoFormat(0)
command LAutoFormatToggle   call SetLAutoFormat(g:_laf_next_state)

function SetLAutoFormat(state)
    if a:state == 0
        autocmd! laf
        let g:_laf_next_state=1
        echo 'Disabled auto-formatter.'
    else
        augroup laf
            autocmd InsertLeave * lua vim.lsp.buf.formatting()
        augroup END
        let g:_laf_next_state=0
        echo 'Enabled auto-formatter.'
    endif
endfunction
