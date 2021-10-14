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

" Tell Vista to use LSP by default
let g:vista_default_executive='nvim_lsp'

" Discord Presence
let g:vimsence_small_text = 'Neovim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing {}'
let g:vimsence_editing_state = 'Project: {}'
let g:vimsence_file_explorer_text = 'Stuck in file sidebar'
let g:vimsence_file_explorer_details = '(Neovim is an IDE too)'

" Nvim-Tree preconfig
let g:nvim_tree_ignore = [ '.git', '.cache', 'build' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1
    \ }


" Builtin Neovim LSP config
lua << EOF
-- Broadcast snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp  = require 'lspconfig'
local util = require 'lspconfig/util'
local tree = require 'nvim-tree'


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
-- Java
lsp.java_language_server.setup{ cmd = { "java-language-server" } }
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
    autocmd VimEnter * NvimTreeOpen
endif
