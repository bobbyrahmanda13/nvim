
-- local lualine = require("lualine")
-- lualine.setup({
--   options = {
--   -- icons_enabled = false,
--   theme = ',
--   -- section_separators = { left = ' ', right = ' ' },
--   -- component_separators = { left = ' ', right = ' ' }
--   }
-- })

local colors = require("solarized-osaka.colors").setup({ transform = true })
local config = require("solarized-osaka.config").options

local solarized_osaka  = {
  normal = {
    a = { bg = colors.blue, fg = colors.black },
    b = { bg = colors.fg, fg = colors.black },
    c = { bg = colors.bg_statusline, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.green, fg = colors.black },
  },

  command = {
    a = { bg = colors.yellow, fg = colors.black },
  },

  visual = {
    a = { bg = colors.magenta, fg = colors.black },
  },

  replace = {
    a = { bg = colors.red, fg = colors.black },
  },

  terminal = {
    a = { bg = colors.green, fg = colors.black },
  },

  inactive = {
    a = { bg = colors.bg_statusline, fg = colors.blue },
    b = { bg = colors.bg_statusline, fg = colors.fg, gui = "bold" },
    c = { bg = colors.bg_statusline, fg = colors.fg },
  }
}

for _, mode in pairs(solarized_osaka) do
  if config.lualine_bold then
    mode.a.gui = "bold"
  end
end

require('lualine').setup{
  options={
    theme = solarized_osaka,
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    -- lualine_b = { 'filename', 'branch' },
    lualine_b = {
      {
        'branch',
        separator = { right = ''},
        left_padding =2 
      },
      {
        'diff',
        separator = { right = ''},
        colored = true,
        symbols = {added = " " , modified = " " , removed = " " },
        diff_color = {
          added = { fg = colors.green300, bg = colors.base03 },
          modified = { fg = colors.yellow300, bg = colors.base03 },
          removed = { fg = colors.red300, bg = colors.base03 },
        }
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange300, fg = colors.none } },
      }
    },
    lualine_c = {
      {
        'filename', 
        color = { fg = colors.none},
        path = 1,
        file_status = false
      },
    },
    lualine_x = {
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = {'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
