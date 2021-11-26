-- Broadcast snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp  = require 'lspconfig'
local util = require 'lspconfig/util'
local tree = require 'nvim-tree'

local nixsh = function (pkg, cmd)
                return { "nix-shell", "-p", pkg, "--command", cmd }
            end

-- Python 3
lsp.jedi_language_server.setup{}
-- Elm
lsp.elmls.setup {               cmd = nixsh("elmPackages.elm-language-server", "elmls") }
-- Rust
lsp.rls.setup{                  cmd = nixsh("rls", "rls") }
-- Haskell
lsp.hls.setup {                 cmd = nixsh("haskellPackages.haskell-language-server", "haskell-language-server --lsp"),
    root_dir = function(fname)
        return util.find_git_ancestor(fname)
            or util.root_pattern("*.cabal", "stack.yaml", "package.yaml", "default.nix", "shell.nix")(fname)
    end
}
-- C/C++
lsp.ccls.setup{                 cmd = nixsh("ccls", "ccls") }
-- Java
lsp.java_language_server.setup{ cmd = nixsh("java-language-server", "java-language-server") }
-- CMake
lsp.cmake.setup{}
-- Dhall
lsp.dhall_lsp_server.setup{     cmd = nixsh("dhall-lsp-server", "dhall-lsp-server") }
-- OCaML
lsp.ocamllsp.setup{             cmd = nixsh("ocamlPackages.ocaml-lsp", "ocamllsp") }
-- Vimscript
lsp.vimls.setup{                cmd = nixsh("nodePackages.vim-language-server", "vim-language-server --stdio") }


vim.lsp.handlers['textDocument/codeAction']     = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/definition']     = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration']    = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol']            = require'lsputil.symbols'.workspace_handler

-- Nvim-Tree config
tree.setup {
    hijack_netrw = true,
    auto_close = true,
    update_cwd = true,
    diagnostics = 
    { enable = true },
    
    view = {
        width = 30,
        side = 'left',
        auto_resize = true
    }
}


