local fwatch = require 'fwatch'
local ibl = require 'ibl'
local coq = require 'coq'
local coqx = require 'coq_3p'
local lsp = require 'lspconfig'
local tsc = require 'nvim-treesitter.configs'
local image = require 'image'

-- Light/dark theme watch
fwatch.watch(os.getenv("XDG_RUNTIME_DIR") .. "/theme",
    { on_event =
        function()
            vim.defer_fn(vim.fn.SetGoyoColor, 10)
            vim.loop.spawn("kitty", { args = { "@", "set-background-opacity", "1" } })
        end
    })

-- Boost LSP using Coq_nvim
function lsp_with_coq(server, params)
    return server.setup(coq.lsp_ensure_capabilities(params))
end

-- Marksman knowledge base
lsp_with_coq(lsp.marksman,      { cmd = nixsh("marksman", { "marksman", "server" })
                                , filetypes = { "markdown", "markdown.mdx", "pandoc" }
                                })

coqx {
    { src = "repl",
      sh = "zsh",
      max_lines = 99,
      deadline = 500,
      unsafe = { "rm", "poweroff", "shutdown", "mv", "sudo" }
    },
    { src = "bc", short_name = "MATH", precision = 6 }
}

-- Indent blank line
ibl.setup {
    indent = { char = '┊' },
}

-- TreeSitter config
vim.env['PATH'] = vim.env['PATH'] .. ':' .. nix_path("tree-sitter", "/bin")

tsc.setup {
    ensure_installed = { "markdown", "markdown_inline" },
    highlight = { enable = false }
}

-- Image.nvim config
image.setup {
    backend = "kitty",
    max_width = 300,
    max_height = 50,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,

    window_overlap_clear_enabled = true,

    integrations = {
        markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki", "pandoc" }
        }
    }
}
