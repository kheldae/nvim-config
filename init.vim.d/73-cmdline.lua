--
-- Extended configuration of Folke's Noice plugin. This will require yet
-- another color dictionnary.
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

-- Noice section
require'noice'.setup {
    presets = {
        command_palette = true
    },
    views = {
        cmdline_popup = {
            relative = "editor",
        },
        cmdline_popupmenu = {
            relative = "editor"
        },
    },
    messages = {
        view = "mini",
        view_warn = "mini",
        view_error = "notify"
    }
}
