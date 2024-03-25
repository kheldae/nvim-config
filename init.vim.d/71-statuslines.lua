--
-- Lualine config (BarBar will be defined elsewhere)
--

local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#292b2f',
  white  = '#c6c6c6',
  red    = '#ff5189',
  yellow = '#e6db74',
  grey   = '#777777',
  silver = '#a0a0a0',
  -- Custom colors
  sand   = '#918154',
  rsand  = '#875f5f',
  darker = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.sand },
    b = { fg = colors.white, bg = colors.darker },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = {
      a = { fg = colors.black, bg = colors.sand },
      c = { fg = "NONE", bg = colors.black }
  },

  visual = { a = { fg = colors.black, bg = colors.rsand } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  terminal = { a = { fg = colors.white, bg = colors.grey } },

  inactive = {
    a = { fg = colors.black, bg = colors.grey },
    b = { fg = colors.black, bg = "NONE" },
    c = { fg = colors.black, bg = "NONE" },
  },
}

local function get_visual_multi()
    local result = vim.fn['VMInfos']()
    -- local current = result.current
    -- local total = result.total
    local ratio = result.ratio
    local patterns = result.patterns
    -- local status = result.status
    return "󱢓 "
        .. ratio
end


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
            {   'mode',
                separator = { left = '', right = '' },
                right_padding = 2
            },
            {   get_visual_multi,
                separator = { left = '', right = '' },
                right_padding = 2
            }
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            {   'location',
                separator = { left = '', right = '' },
                left_padding = 2
            }
        }
    },
    inactive_sections = {
        lualine_a = {
            {   'filename',
                separator = { left = '', right = '' },
                right_padding = 2
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {   'location',
                separator = { left = '', right = '' },
                left_padding = 2
            }
        }
    }
}
