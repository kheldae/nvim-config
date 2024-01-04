--
-- Language servers and debug adapters config
--

require 'nix'

local nix = Nix:new()
local pscan = require 'plenary.scandir'
local path = require 'plenary.path'

---

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp  = require 'lspconfig'
local lspc = require 'lspconfig.configs'
local util = require 'lspconfig/util'
local dap = require 'dap'
local jdtls = require 'jdtls'
local coq = require 'coq'
local coql = require 'coq-lsp'


-- Boost LSP using Coq_nvim
function lsp_with_coq(server, params)
    return server.setup(coq.lsp_ensure_capabilities(params))
end

local lsp_cmake_sessions = {}

-- Automatically set up CMake compile_commands.json
function setupCmakeIntegration()
    local op = {title="CMake build lists integration"}
    local ppr = util.root_pattern('.ccls', '.git')(vim.fn.expand('%:p'))
    local bdir = "!!INVALID!!"
    local mybuf = vim.api.nvim_get_current_buf()

    if ppr == nil then
        return ""
    elseif lsp_cmake_sessions[ppr] ~= nil then
        return lsp_cmake_sessions[ppr]
    elseif path.new(ppr .. "/CMakeLists.txt"):exists() then
        cmls = pscan.scan_dir(ppr, {
            respect_gitignore = true,
            add_dirs = false,
            search_pattern = "CMakeLists.txt"
        })
        bdrs = pscan.scan_dir(ppr, {
            respect_gitignore = false,
            add_dirs = false,
            search_pattern = "CMakeCache.txt"
        })
        if bdrs[1] == nil then
            bdir = io.popen("mktemp -d --suffix=.cmake"):read()
        else
            bdir = bdrs[1]
            bdir = bdir:match("(.*/)")
        end

        local cmakecmd = "2>&1 >"..bdir.."/cmake.log "..
                         "cmake -B "..bdir..
                         " -DCMAKE_EXPORT_COMPILE_COMMANDS=ON "..ppr

        for _, el in pairs(cmls) do
            fwatch.watch(el, {
            on_event = function()
                -- rebuild CMake then restart ccls
                io.popen(cmakecmd)
                vim.notify("Reloaded compile commands, restarting LSP...", "info", op)
                vim.schedule(function()
                    lsp["ccls"].launch(mybuf)
                end)
            end
            })
        end
        -- perform first CMake build
        io.popen(cmakecmd)
        lsp_cmake_sessions[ppr] = bdir
        return bdir
    else
        lsp_cmake_sessions[ppr] = ppr
        return ppr
    end
end

-- Python 3
lsp_with_coq(lsp.pylsp,         { cmd = nix:shell("python3Packages.python-lsp-server"
                                        , { "pylsp" })
                                })
-- Elm
lsp_with_coq(lsp.elmls,         { cmd = nix:shell("elmPackages.elm-language-server"
                                        , { "elm-language-server" })
                                })
-- Rust
lsp_with_coq(lsp.rust_analyzer, { cmd = nix:shell("rust-analyzer", {"rust-analyzer"}) })
-- Haskell
lsp_with_coq(lsp.hls,           { cmd = nix:shell("haskell-language-server"
                                        , {"haskell-language-server-wrapper", "--lsp"})
                                , root_dir = function(fname)
                                    return util.find_git_ancestor(fname)
                                        or util.root_pattern("*.cabal", "stack.yaml", "package.yaml", "default.nix", "shell.nix")(fname)
                                  end
                                })
-- C/C++
lsp_with_coq(lsp.ccls,          { cmd = nix:shell("ccls", {"ccls"})
                                , init_options =
                                  { highlight = { lsRanges = true }
                                  , compilationDatabaseDirectory =
                                        setupCmakeIntegration()
                                  }
                                , filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "c.doxygen", "cpp.doxygen", "cuda.doxygen" }
                                })
-- CMake
lsp_with_coq(lsp.cmake,         { cmd = nix:shell("cmake-language-server"
                                        , {"cmake-language-server"})
                                })
-- Dhall
lsp_with_coq(lsp.dhall_lsp_server,
                                { cmd = nix:shell("dhall-lsp-server", {"dhall-lsp-server"}) })
-- JSonnet
lsp_with_coq(lsp.jsonnet_ls,    { cmd = nix:shell("jsonnet-language-server", {"jsonnet-language-server"}) })
-- OCaML
lsp_with_coq(lsp.ocamllsp,      { cmd = nix:shell("ocamlPackages.ocaml-lsp", {"ocamllsp"})
                                , cmd_env =
                                  { OCAMLLSP_SEMANTIC_HIGHLIGHTING = "full/delta"
                                  }
                                })
-- Vimscript
lsp_with_coq(lsp.vimls,         { cmd = nix:shell("nodePackages.vim-language-server"
                                        , {"vim-language-server", "--stdio"})
                                })
-- PureScript
lsp_with_coq(lsp.purescriptls,  { cmd = nix:shell("nodePackages.purescript-language-server"
                                        , {"purescript-language-server", "--stdio"})
                                })
-- Nix
lsp_with_coq(lsp.nixd,          { cmd = nix:shell("nixd", {"nixd"}) })
-- LaTeX
lsp_with_coq(lsp.texlab,        { cmd = nix:shell("texlab", {"texlab"}) })
-- Javascript and TypeScript
lsp_with_coq(lsp.tsserver,      { cmd = nix:shell("typescript", {"tsserver", "--stdio"}) })
-- CSS
lsp_with_coq(lsp.cssls,         { cmd = nix:shell("nodePackages.vscode-css-languageserver-bin"
                                        , { "css-languageserver", "--stdio" })
                                })
-- Marksman knowledge base
lsp_with_coq(lsp.marksman,      { cmd = nix:shell("marksman", { "marksman", "server" })
                                , filetypes = { "markdown", "markdown.mdx", "pandoc" }
                                })
-- Java
lsp_with_coq(lsp.jdtls,         { cmd = nix:shell("jdt-language-server"
                                        , {"jdt-language-server", "-configuration", os.getenv("HOME").."/.cache/jdtls/config", "-data", os.getenv("HOME").."/.cache/jdtls/workspace"})
                                , cmd_env = { GRADLE_HOME = os.getenv("GRADLE_HOME") }
                                , root_dir = util.root_pattern('build.gradle', 'build.gradle.kt', 'pom.xml', '.git', '.javals')
                                , init_options = {
                                    bundles = {
                                      nix:path("vscode-extensions.vscjava.vscode-java-debug", "/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-0.44.0.jar")
                                    }
                                  }
                                , on_attach = function(cl, bn)
                                    jdtls.setup_dap({ hotcodereplace = 'auto'})
                                  end
                                })
-- Coq (the theorem language)
coql.setup {
  lsp = {
    cmd = nix:shell("coqPackages_8_16.coq-lsp", {"coq-lsp"}),
    init_options = {
      show_notices_as_diagnostics = true
    }
  }
}


-- Third-party Coq (the completion engine) providers
require 'coq_3p' {
  { src = "ultisnips", short_name = "US" },
  { src = "repl",
    sh = "zsh",
    max_lines = 99,
    deadline = 500,
    unsafe = { "rm", "poweroff", "shutdown", "mv", "sudo" }
  },
  { src = "nvimlua",
    short_name = "nLUA",
    conf_only = true
  },
  { src = "bc", short_name = "MATH", precision = 6 },
  { src = "dap", short_name = "DBG" }
}

-- Fancy lsputil popups
vim.lsp.handlers['textDocument/codeAction']     = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/definition']     = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration']    = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol']            = require'lsputil.symbols'.workspace_handler

-- stfu
vim.lsp._unsupported_method = function(m) end


-- Debug Adapter Protocol
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.cpp = {
    { name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
      args = {}
    },
    { name = 'Attach to remote gdb',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
      initCommands = {
        function()
            return 'gdb-remote '..vim.fn.input('Remote gdb address: ', '127.0.0.1:1234')
        end
      }
    }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.java = {
    { type = 'java';
      request = 'attach';
      name = "Debug (Attach) - Remote";
      hostName = "127.0.0.1";
      port = 5005;
    }
}
