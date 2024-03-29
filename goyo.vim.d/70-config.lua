--
-- Configs for miscellaneous Lua-powered plugins
--

require 'nix'

local nix = Nix:new()

-- Theme hotswap
require'fwatch'.watch(os.getenv("XDG_RUNTIME_DIR") .. "/theme",
    {   on_event = function()
            vim.defer_fn(vim.fn.SetColor, 10)
        end
    })

-- Indent blank line
require'ibl'.setup {
    indent = { char = ' ' },
}

-- Per-project secure exrc
require'exrc'.setup {
    files = {
        ".nvimrc.lua",
        ".nvimrc",
        ".exrc.lua",
        ".exrc"
    }
}

-- TreeSitter config
vim.env['PATH'] = vim.env['PATH'] .. ':' .. nix:path("tree-sitter", "/bin")

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "markdown", "markdown_inline" },
    highlight = { enable = false }
}

-- Image.nvim config
require'image'.setup {
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
