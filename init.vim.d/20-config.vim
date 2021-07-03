" Deoplete config
let g:deoplete#sources#rust#racer_binary = system('which racer')
let g:deoplete#sources#rust#rust_source_path = '/usr/local/src/rust/src'
let g:deoplete#enable_at_startup = v:true
let g:deoplete#lsp#handler_enabled = v:true
let g:deoplete#lsp#use_icons_for_candidates = v:true

let g:csv_autocmd_arrange=1

" Set location of libclang for Deoplete
let g:clang_library_path="/lib/libclang.so"
" and tell clang to use its default keymaps
let g:clang_make_default_keymappings=1

" Builtin Neovim LSP config
lua << EOF
-- Broadcast snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp  = require 'lspconfig'
local util = require 'lspconfig/util'


-- Python 3
lsp.jedi_language_server.setup{}
-- Elm
lsp.elmls.setup{}
-- Rust
lsp.rls.setup{}
-- Haskell
lsp.hls.setup {
    root_dir = function(fname)
        return util.find_git_ancestor(fname)
            or util.root_pattern("*.cabal", "stack.yaml", "package.yaml", "default.nix", "shell.nix")(fname)
    end
}
-- C/C++
lsp.ccls.setup{}
-- CMake
lsp.cmake.setup{}
-- Dhall
lsp.dhall_lsp_server.setup{}
-- Vimscript
lsp.vimls.setup{}


vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF


" Deoplete preview
let g:float_preview#docked = 0

" Rust Playpen clipboard command
let g:rust_clip_command = 'xclip -selection clipboard'

" Suda prefix
let g:suda#prefix = 'sudo:'

" DevIcons settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableNERDTreeRedraw = 0

" Small windows don't need NERDTree
if &columns > 100
    autocmd VimEnter * NERDTree
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

