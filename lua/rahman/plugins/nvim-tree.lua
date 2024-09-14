return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy =false,
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local HEIGHT_RATIO = 0.8  -- You can change this
    local WIDTH_RATIO = 0.7   -- You can change this too


    local bind = vim.keymap.set

    -- nvim tree keymap
    bind("n","<leader>ex",":NvimTreeToggle<CR>", {desc = "Toggle file explorer"})
    bind("n","<leader>er",":NvimTreeRefresh<CR>", {desc = "Toggle file explorer"})


    require("nvim-tree").setup({
      view = {
        relativenumber = false,
        number = true,
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
            - vim.opt.cmdheight:get()
            return {
              border = 'rounded',
              relative = 'editor',
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      },
      filters = {
        custom = {".DS_Store",".nuxt",".undodir","node_modules","\\.git$", "\\.pyc$", "__pycache__"}
      },
      git = {
        ignore = false
      },
      ui = {
        confirm = {
          remove = true,
          trash = true,
          default_yes = false,
        },
      },
      renderer = {
        full_name = true,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          -- web_devicons = {
          --   file = {
          --     enable = true,
          --     color = true,
          --   },
          -- },
          padding = " ",
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "󰆤",
            modified = "●",
              hidden = "󰜌",
            git = {
              unstaged = "󰅙",
              staged = "",
              unmerged = "󰘭",
              renamed = "",
              untracked = "",
              deleted = "󰗨",
              ignored = "",
            },
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
      }
    })
  end
}
