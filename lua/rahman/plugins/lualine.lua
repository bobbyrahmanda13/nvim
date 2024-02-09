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

-- local empty = require('lualine.component'):extend()

-- local function jarak()
--   return ' '
-- end

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.base03, bg = colors.base03 } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      -- comp.separator = left and { right = '' } or { left = '' }
      comp.separator = left and { right = ' ' } or { left = ' '}
    end
  end
  return sections
end


require('lualine').setup{
  options =
    {
      theme = solarized_osaka,
      -- icons_enabled = true,
      -- component_separators = { left = '', right = '' },
      -- section_separators = {left = '', right = ''  },
    },
  sections = process_sections {
    lualine_a = {
      { 'mode', 
        -- icons_enabled = true, 
        icon = {
          " ",
          color = { fg = colors.base04, bg = colors.base1, gui = 'bold'}
        },
        -- color = { fg = colors.base0, bg = colors.green300, gui = 'bold' },
        -- separator = { left = '', right = '' },
        -- left_padding = 2, right_padding = 0,
      },
    },
    -- lualine_b = { 'filename', 'branch' },
    lualine_b = {
      {
        'branch',
        -- separator = { left = '', right = '' },
        -- left_padding = 0, right_padding = 2,
        -- icon = {
        --   " ",
        --   -- align = 'left',
          -- color = { fg = colors.base03, bg = colors.base0, gui = 'bold'},
        --   -- separator = {left = '', right = ''}
        -- },
        -- left_padding = 0,
        color = { fg = colors.base1, bg = colors.base04, gui = 'bold' },
      },
      {
        'diff',
        -- separator = { right = '',left = ''},
        colored = true,
        symbols = { added = " " , modified = " " , removed = " " },
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
        on_click = function() 
          require('telescope.builtin').find_files()
          -- print('file name clicked') 
        end, 
        icon = ' ',
        color = { fg = colors.base1, bg = colors.yellow900, gui = 'bold'},
        path = 4,
        file_status = false,
        -- separator = { right = '', left = ''},
      },
    },
    lualine_x = {
      {
        'diagnostics',
        on_click = function()
          require('telescope.builtin').diagnostics()
        end,
        -- separator = { left = '' },
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
        -- icon = ' LSP:',
        icon = {'  ', color = {bg = colors.red900, fg = colors.base1}},
        -- separator = { left = '', right = ''},
        -- separator = { left = ' ', right = ' '},
        color = { fg = colors.base1, gui = 'bold', bg = colors.base04 },
      },

      {
        'encoding',
        -- separator = { left = '' },
        color = {bg = colors.red900, fg = colors.base1, gui = 'bold'}

      },
      -- {
      --   'fileformat',
      --   -- separator = { left = '' },
      -- },
      {
        'filetype',
        color = {bg = colors.magenta900, fg = colors.base1, gui = 'bold'}
        -- separator = { left = '', right = ' ' },
      }
    },
    lualine_y = {
      {
        'progress', left_padding = 0,
        color = {bg = colors.green900, fg = colors.base1, gui = 'bold'}
      }
    },
    lualine_z = {
      { 
        'location', 
        -- function()
        --   return "Ln:%l Col:%c"
        -- end
        -- separator = { right = '' }, left_padding = 2 },
      }  
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
