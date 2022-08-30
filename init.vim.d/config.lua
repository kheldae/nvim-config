-- Broadcast snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp  = require 'lspconfig'
local util = require 'lspconfig/util'
local tree = require 'nvim-tree'
local trouble = require 'trouble'
local vgit = require 'vgit'
local fwatch = require 'fwatch'

vim.notify = require 'notify'

---

local has_nix = false

local f = io.open('/nix')
if f then
    f:close()
    has_nix = true
end

local nixsh_fetch = {}

function nixsh(pkg, cmd)
    if has_nix then             -- Generate nix-shell wrapper
        table.insert(nixsh_fetch, pkg)
        return { "nix-shell", "-p", pkg, "--command", cmd }
    else
        local bits = {}         -- Split command argument for direct use
        for substring in cmd:gmatch("%S+") do
            table.insert(bits, substring)
        end
        return bits
    end
end


function _G.nixsh_prefetch()
    local op = {title="LSP Servers over Nix Shell"}
    if not has_nix then
        vim.notify("Auto-installing language servers requires Nix.", "error", op)
        return
    end
    local args = { "--command", "echo" }
    for key, value in pairs(nixsh_fetch) do
        table.insert(args, "-p")
        table.insert(args, value)
    end
    vim.notify("Prefetching language servers, hang tight...", "info", op)
    vim.loop.spawn("nix-shell", { args = args })
    vim.notify("Done!", "info", op)
end

-- Python 3
lsp.jedi_language_server.setup{ cmd = nixsh("python3Packages.jedi-language-server", "jedi-language-server") }
-- Elm
lsp.elmls.setup {               cmd = nixsh("elmPackages.elm-language-server", "elm-language-server") }
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
lsp.cmake.setup{                cmd = nixsh("cmake-language-server", "cmake-language-server") }
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
    update_cwd = true,

    diagnostics =
    { enable = true },

    renderer = {
        indent_markers = { enable = true },
        icons = { show = { file = true, folder = true, folder_arrow = true, git = true } }
    },

    filters = {
        dotfiles = true,
        custom = { '.git', '.cache', 'build', '_secrets.yaml' }
    },

    git =
    { ignore = true, },

    view = {
        width = 30,
        side = 'left',
        adaptive_size = false
    }
}

-- Trouble diagnostics list config
trouble.setup {}

-- Visual Git integration
vgit.setup {}

-- Light/dark theme watch
fwatch.watch(os.getenv("XDG_RUNTIME_DIR") .. "/theme",
    { on_event = function()
                    vim.defer_fn(vim.fn.SetColor, 10)
                end
    })

require"notify".setup {
    background_colour="#000000"
}
