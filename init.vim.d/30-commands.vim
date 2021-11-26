" Shortcut to call Haskell REPL on current file
command GHCi bot split | term ghci %

command -nargs=1 I call JupyterConsole(<f-args>)

function JupyterConsole(kernel)
    let jupyCommand = 'jupyter console --kernel '.a:kernel
    bot split
    execute "term" l:jupyCommand
endfunction

command LFormat     lua vim.lsp.buf.formatting()
command LActions    lua vim.lsp.buf.code_action()

