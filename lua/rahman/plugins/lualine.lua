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
  options =
    {
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
    },
    lualine_c = {
      {
        'filename', 
        on_click = function() print('file name clicked') end, 
        color = { fg = colors.red200},
        path = 4,
        file_status = false
      },
    },
    lualine_x = {
      {
        'diagnostics',
        separator = { left = '' },
        sources = { 'nvim_diagnostic'},
        sections = { 'error', 'warn', 'info', 'hint' },

        diagnostics_color = {
          error = { fg = colors.red300, bg = colors.base03 }, -- Changes diagnostics' error color.
          added = { fg = colors.green300, bg = colors.base03 },
          warn  = { fg = colors.yellow300, bg = colors.base03 },  -- Changes diagnostics' warn color.
          info  = { fg = colors.blue300, bg = colors.base03 },  -- Changes diagnostics' info color.
          hint  = { fg = colors.cyan300, bg = colors.base03 },  -- Changes diagnostics' hint color.
        },
        symbols = { error = " ", warn = " ", hint = "󰠠 ", info = " " },
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = true, -- Update diagnostics in insert mode. default = false
        always_visible = false,   -- Show diagnostics even if there are none.
      },
      {
        -- code from https://github.com/nvim-lualine/lualine.nvim/blob/566b7036f717f3d676362742630518a47f132fff/examples/evil_lualine.lua
        -- Lsp server name .
        function()
          local msg = 'Not Active'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        -- separator = { left = '', right = ''},
        separator = { left = ' ', right = ' '},
        color = { fg = colors.base05, gui = 'italic', bg = colors.base03 },
      },

      {
        'encoding',
        separator = { left = '' },
      },
      {
        'fileformat',
        separator = { left = '' },
      },
      {
        'filetype',
        separator = { left = '', right = ' ' },
      }
    },
    lualine_y = {
      {
        'progress',
      }
    },
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
