local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local fwatch = require 'fwatch'
local ibl = require 'ibl'
local coq = require 'coq'
local coqx = require 'coq_3p'
local lsp = require 'lspconfig'
local tsc = require 'nvim-treesitter.configs'
local image = require 'image'
local exrc = require 'exrc'

--

local has_nix = false

local f = io.open('/nix')
if f then
    f:close()
    has_nix = true
end

local nixsh_fetch = {}

function nix_path(pkg, path)
    if has_nix
    then
        table.insert(nixsh_fetch, pkg)
        local drv = io.popen("nix --extra-experimental-features 'nix-command flakes' build --quiet --no-link --print-out-paths "..vim.g.config_root.."#"..pkg):read()
        return drv .. path
    else
        return ""
    end
end

function nixsh(pkg, cmd)
    if has_nix and (vim.call('executable', cmd[1]) == 0)
    then                        -- Generate nix shell wrapper
        table.insert(nixsh_fetch, pkg)
        local cmdl = { "nix", "--extra-experimental-features", "nix-command flakes", "shell", vim.g.config_root .."#"..pkg, "-c" }
        for k, el in pairs(cmd) do
            table.insert(cmdl, el)
        end
        return cmdl
    else
        return cmd
    end
end


function _G.nixsh_prefetch()
    local op = {title="LSP Servers over Nix"}
    if not has_nix then
        vim.notify("Auto-installing language servers requires Nix.", "error", op)
        return
    end
    local args = { "--extra-experimental-features", "nix-command flakes", "build", "--quiet", "--no-link" }
    for key, value in pairs(nixsh_fetch) do
        table.insert(args, vim.g.config_root..'#'..value)
    end
    vim.notify("Prefetching language servers, hang tight...", "info", op)
    vim.loop.spawn("nix", { args = args },
        function()
            vim.notify("Done!", "info", op)
        end)
end

--

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
    indent = { char = ' ' },
}

-- Per-project secure exrc
exrc.setup {
    files = {
        ".nvimrc.lua",
        ".nvimrc",
        ".exrc.lua",
        ".exrc"
    }
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
            clear_in_insert_mode = true,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki", "pandoc" }
        }
    }
}
