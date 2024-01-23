-- Lualine config
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  yellow = '#e6db74',
  grey   = '#303030',
  silver = '#a0a0a0'
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.yellow },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = "NONE" },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.black, bg = colors.silver },
    b = { fg = colors.black, bg = "NONE" },
    c = { fg = colors.black, bg = "NONE" },
  },
}



require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = bubbles_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {
                'NvimTree', 'vista_kind', 'vista', 'Trouble', 'coq-goals',
                'vista_markdown'
            }
        },
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 }
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 }
        }
    },
    inactive_sections = {
        lualine_a = { 
            { 'filename', separator = { left = '', right = '' }, right_padding = 2 }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            { 'location', separator = { left = '', right = '' }, left_padding = 2 },
        }
    }
}

-- Barbar config
require'barbar'.setup {
    sidebar_filetypes = {
        NvimTree = true,
        vista_kind = true,
        vista = true,
    },
    icons = {
        filetypes = {
            enabled = true,
            custom_colors = true,
        }
    },
    auto_hide = 1
}
