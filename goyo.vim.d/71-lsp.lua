--
-- Language servers (mostly just Markdown)
--

require 'nix'

local nix = Nix:new()

--

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp = require 'lspconfig'
local coq = require 'coq'

-- Boost LSP using Coq_nvim
function lsp_with_coq(server, params)
    return server.setup(coq.lsp_ensure_capabilities(params))
end

-- Marksman knowledge base
lsp_with_coq(lsp.marksman,  { cmd = nix:shell("marksman", { "marksman", "server" })
                            , filetypes = { "markdown", "markdown.mdx", "pandoc" }
                            })

require 'coq_3p' {
    { src = "repl",
      sh = "zsh",
      max_lines = 99,
      deadline = 500,
      unsafe = { "rm", "poweroff", "shutdown", "mv", "sudo" }
    },
    { src = "bc", short_name = "MATH", precision = 6 }
}

