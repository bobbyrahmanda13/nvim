local opts = { noremap = true, silent = true }
local lspconfig = vim.lsp.config
local bind = vim.keymap.set
local severity = vim.diagnostic.severity

vim.g.mapleader = " "

-- general keymaps
bind("i", "jk", "<Esc>")              -- out insert mode to normal mode
bind("n", "<leader>bt", ":term<CR>")  -- open terminal
bind("n", "<leader>lz", ":Lazy<CR>")  -- open lazy
bind("n", "<leader>ms", ":Mason<CR>") -- open mason

bind("n", "<C-s>", ":w<CR>")          -- save

bind("n", "<leader>sv", "<C-w>v")     -- split window vertically
bind("n", "<leader>sh", "<C-w>s")     -- split window horizontaly
bind("n", "<leader>se", "<C-w>=")     -- make split windows equal width
bind("n", "<leader>sx", ":close<CR>") -- close current split window

bind("n", "rv", ":vertical resize +5")
bind("n", "rvv", ":vertical resize -5")
bind("n", "rh", ":horizontal resize +5")
bind("n", "rhh", ":horizontal resize -5")

bind("n", "<leader>to", ":tabnew<CR>")   -- open new tab
bind("n", "<leader>tx", ":tabclose<CR>") -- close current tab
bind("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
bind("n", "<leader>tp", ":tabp<CR>")     -- go to previous tab
bind("n", "<leader>tf", ":tabnew %<CR>") -- go to previous tab

bind("n", "<leader>h", "<C-w>h")         -- move cursor window to left
bind("n", "<leader>j", "<C-w>j")         -- move cursor window to down
bind("n", "<leader>k", "<C-w>k")         -- move cursor window to up
bind("n", "<leader>l", "<C-w>l")         -- move cursor window to right

bind("v", "J", ":m '>+1<CR>gv=gv")       -- moves lines down in visual selection
bind("v", "K", ":m '<-2<CR>gv=gv")       -- moves lines up in visual selection

bind("n", "J", "mzJ`z")                  -- menggabungkan garis bawah ke garis atas dan meletakkannya di belakang
bind("n", "Q", "<nop>")

bind("n", "<C-d>", "<C-d>zz") -- move down in buffer with cursor centered
bind("n", "<C-u>", "<C-u>zz") -- move up in buffer with cursor centered

bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

bind("v", "<", "<gv", opts)
bind("v", ">", ">gv", opts)

bind("x", "<leader>p", [["_dP]]) -- paste without replacing clipboard content
bind("v", "p", '"_dp', opts)
bind({ "n", "v" }, "<leader>d", [["_d]])

bind({ "n", "v" }, "<leader>y", "\"+yap") -- yank to paragraph
bind("n", "<leader>Y", [["+Y]])

bind("n", "y1", "yiw")   -- yank word
bind("n", "t2", "viwxi") -- remove word

bind("n", "<leader>f", vim.lsp.buf.format)

bind("n", "x", '"_x', opts)                                                    -- prevents deleted characters from copying to clipboard

bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --Replace word cursor is on globally
bind("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/]])
bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

bind("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("rahman-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~")
  vim.fn.setreg("+", filePath)
  print("File path copied to clipboard:" .. filePath)
end, { desc = "Copy file path to clipboard" }
)

bind("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- terminal nvim vim.keymap
bind("t", "<A-n>", [[<C-\><C-n>]])
bind("t", "<A-h>", [[<C-\><C-n><C-w>h]])
bind("t", "<A-j>", [[<C-\><C-n><C-w>j]])
bind("t", "<A-k>", [[<C-\><C-n><C-w>k]])
bind("t", "<A-l>", [[<C-\><C-n><C-w>l]])

-- vim.keymap autoclose
bind("i", "(", "()<left>")
bind("i", "[", "[]<left>")
bind("i", "{", "{}<left>")
bind("i", "<", "<><left>")
bind("i", "'", "''<left>")
bind("i", '"', '""<left>')

-- Keymap render-markdown
bind("n", "<leader>md", ":RenderMarkdown toggle<CR>") -- render markdown

-- terminal nvim vim.keymap
bind("t", "<A-n>", [[<C-\><C-n>]])
bind("t", "<A-h>", [[<C-\><C-n><C-w>h]])
bind("t", "<A-j>", [[<C-\><C-n><C-w>j]])
bind("t", "<A-k>", [[<C-\><C-n><C-w>k]])
bind("t", "<A-l>", [[<C-\><C-n><C-w>l]])

bind("n", "<leader>gf", [[ggVG=]])


-- disable key
bind("n", "q", "<Nop>")
bind("n", "<Left>", "<Nop>")
bind("n", "<Right>", "<Nop>")
bind("n", "<Up>", "<Nop>")
bind("n", "<Down>", "<Nop>")
bind("n", "<C-z>", "<Nop>")

local vopt = vim.opt

-- options config nvim

vopt.clipboard = 'unnamedplus'

vopt.inccommand = "split"
vopt.number = true
vopt.relativenumber = true

vim.o.mouse = 'a'
vopt.showbreak = '↪'
vopt.backspace = { "start", "eol", "indent" }

vopt.foldenable = false
vopt.foldlevel = 2
vopt.foldmethod = 'indent'

vopt.list = true
vopt.listchars = {
  space = " ",
  eol = "",
  tab = "▎ ",
  -- tab = "|_>",
  trail = ".",
  extends = "❯",
  precedes = "❮",
  nbsp = "",
}
vopt.fillchars = {
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
  diff = "╱",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
  eob = " ",
}

vopt.tabstop = 2
vopt.shiftwidth = 2
vopt.softtabstop = 2
vopt.expandtab = true

vopt.title = true
vopt.autoindent = true
vopt.smartindent = true
vopt.breakindent = true
vopt.fileencodings = "utf-8"
vim.scriptencoding = "utf-8"
vopt.encoding = "utf-8"
vopt.smarttab = true

vopt.wrap = true

vopt.hlsearch = false
vopt.incsearch = true

vopt.termguicolors = true

vopt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vopt.smartcase = true  -- Case insensitive searching UNLESS /C or capital in search

vopt.splitbelow = true -- Put new windows below current
vopt.splitright = true -- Put new windows right of current

vopt.backup = false
vopt.swapfile = false
vopt.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
vopt.undofile = true

vim.g.have_nerd_font = true

vopt.colorcolumn = "100"
vopt.cursorline = true

vopt.updatetime = 50

vopt.isfname:append("@-@")

vopt.scrolloff = 8
vopt.signcolumn = "yes"

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- manage plugin vim.pack.add
vim.pack.add({
  { src = "https://github.com/craftzdog/solarized-osaka.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
  { src = "https://github.com/mrcjkb/rustaceanvim",                      version = '^8' },
})


-- config lua_ls
local luals_config = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "empty" },
      }
    }
  }
}

lspconfig("lua_ls", luals_config)

-- config vue_ls, vtsls, ts_ls
local vue_language_server_path = vim.fn.stdpath('data') ..
    "/home/rahman/.local/share/pnpm/global/5/node_modules/@vue/language-server"

local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}

local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}

local vue_ls_config = {}
local rust_config = {}

lspconfig('vtsls', vtsls_config)
lspconfig('vue_ls', vue_ls_config)
lspconfig('ts_ls', ts_ls_config)
lspconfig('rust-analyzer', rust_config)

--
vim.lsp.enable({ "lua_ls", "gopls", "vue_ls", "vtsls", "ts_ls", "rust-analyzer" })


-- plugin nvim-treesitter
require("nvim-treesitter").install { "javascript", "typescript", "html", "css", "python", "bash", "markdown", "markdown_inline", "lua", "sql", "regex", "json", "scss", "zig", "vue", "go", "templ", "rust", "graphql", "gitignore", "c", "yaml", "toml", "gotmpl" }


-- plugin nvim-tree
--
-- nvim-tree config
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.7  -- You can change this too


-- nvim tree keymap
bind("n", "<leader>ex", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
bind("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "Toggle file explorer" })

require("nvim-tree").setup({
  view = {
    relativenumber = false,
    number = true,
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vopt.columns:get()
        local screen_h = vopt.lines:get() - vopt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vopt.lines:get() - window_h) / 2)
            - vopt.cmdheight:get()
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
      return math.floor(vopt.columns:get() * WIDTH_RATIO)
    end,
  },
  filters = {
    custom = { ".DS_Store", ".nuxt", ".undodir", "node_modules", "\\.git$", "\\.pyc$", "__pycache__" }
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
        corner = "╚",
        edge = "║",
        item = "║",
        bottom = "═",
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


vim.cmd("colorscheme solarized-osaka")

-- configuration diagnostic

vim.cmd([[highlight DiagnosticSignError gui=bold guifg=#dc312e ]])
vim.cmd([[highlight DiagnosticSignWarn gui=bold guifg=#b38600 ]])
vim.cmd([[highlight DiagnosticHintLn gui=bold guifg=#2aa298 ]])
vim.cmd([[highlight DiagnosticInfoLn gui=bold guifg=#859900 ]])


vim.diagnostic.config({
  underline = true,
  virtual_lines = {
    current_line = true,
    format = function(diagnostic)
      local message = diagnostic.message
      local win_width = vim.api.nvim_win_get_width(0)
      local max_width = math.floor(win_width * 3 / 4)

      if #message <= max_width then
        return message
      end

      -- wrap if length message is greather than max_width
      local wrapped = {}
      for i = 1, #message, max_width do
        table.insert(wrapped, message:sub(i, i + max_width - 1))
      end

      return table.concat(wrapped, "\n")
    end,
  },
  -- signs = true,
  signs = {
    text = {
      -- [vim.diagnostic.severity.ERROR] = signsIcon.Error,
      -- [vim.diagnostic.severity.WARN] = signsIcon.Warn,
      -- [vim.diagnostic.severity.HINT] = signsIcon.Hint,
      -- [vim.diagnostic.severity.INFO] = signsIcon.Info,
      -- [vim.diagnostic.severity.ERROR] = ' ',
      [severity.ERROR] = ' ',
      [severity.WARN] = ' ',
      [severity.HINT] = '󰌵 ',
      [severity.INFO] = ' ',
    },
  }
})

-- plugin todo-comments
require("todo-comments").setup()

-- plugin lualine

local colors          = require("solarized-osaka.colors").setup({ transform = true })
local config          = require("solarized-osaka.config").options

local solarized_osaka = {
  normal = {
    a = { bg = colors.base03, fg = colors.blue100 },
    b = { bg = colors.fg, fg = colors.black },
    c = { bg = colors.bg_statusline, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.base03, fg = colors.green100 },
  },

  command = {
    a = { bg = colors.base03, fg = colors.yellow100 },
  },

  visual = {
    a = { bg = colors.base03, fg = colors.magenta100 },
  },

  replace = {
    a = { bg = colors.base03, fg = colors.red100 },
  },

  terminal = {
    a = { bg = colors.base03, fg = colors.orange100 },
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
      comp.separator = left and { right = ' ' } or { left = ' ' }
      -- comp.separator = {left = '' } and { right = '' }
    end
  end
  return sections
end

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

require('lualine').setup {
  options =
  {
    theme = solarized_osaka,
    -- icons_enabled = true,
    -- component_separators = { left = '>', right = '┇' },
    -- section_separators = {left = '', right = ''  },
  },
  ignore_focus = {},
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  },
  sections = process_sections {
    lualine_a = {
      { 'mode',
        -- icons_enabled = true,
        icon = {
          " ",
          color = { fg = colors.base4, bg = colors.base03, gui = 'bold' }
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
        icon = {
          "",
          -- align = 'left',
          color = { fg = colors.orange100, bg = colors.base03, gui = 'bold' },
          --   -- separator = {left = '', right = ''}
        },
        -- left_padding = 0,
        color = { fg = colors.orange100, bg = colors.base03, gui = 'bold' },
      },
      {
        'diff',
        -- separator = { right = '',left = ''},
        colored = true,
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
          added = { fg = colors.green300, bg = colors.base03, gui = 'bold' },
          modified = { fg = colors.yellow300, bg = colors.base03, gui = 'bold' },
          removed = { fg = colors.red300, bg = colors.base03, gui = 'bold' },
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
        color = { fg = colors.yellow100, bg = colors.base03, gui = 'bold' },
        path = 4,
        file_status = false,
        -- separator = { right = '┇', left = '┇'},
      },
    },
    lualine_x = {
      {
        'diagnostics',
        on_click = function()
          require('telescope.builtin').diagnostics()
        end,
        -- separator = { left = '' },
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },

        diagnostics_color = {
          error = { fg = colors.red300, bg = colors.base03, gui = 'bold' },    -- Changes diagnostics' error color.
          added = { fg = colors.green300, bg = colors.base03, gui = 'bold' },
          warn  = { fg = colors.yellow300, bg = colors.base03, gui = 'bold' }, -- Changes diagnostics' warn color.
          info  = { fg = colors.blue300, bg = colors.base03, gui = 'bold' },   -- Changes diagnostics' info color.
          hint  = { fg = colors.cyan300, bg = colors.base03, gui = 'bold' },   -- Changes diagnostics' hint color.
        },
        symbols = { error = " ", warn = " ", hint = "󰌵 ", info = " " },
        colored = true,          -- Displays diagnostics status in color if set to true.
        update_in_insert = true, -- Update diagnostics in insert mode. default = false
        always_visible = false,  -- Show diagnostics even if there are none.
      },
      {
        -- code from https://github.com/nvim-lualine/lualine.nvim/blob/566b7036f717f3d676362742630518a47f132fff/examples/evil_lualine.lua
        -- Lsp server name .
        function()
          local msg = 'No LSP'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_clients()
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
        -- icon = {'  ', color = {bg = colors.base03, fg = colors.red100}},
        -- separator = { left = '', right = ''},
        -- separator = { left = ' ', right = ' '},
        color = { fg = colors.base4, gui = 'bold', bg = colors.base03 },
      },

      {
        'filetype',
        color = { bg = colors.base03, fg = colors.magenta100, gui = 'bold' }
        -- separator = { left = '', right = ' ' },
      }
    },
    lualine_y = {
      {
        'progress', left_padding = 0,
        color = { bg = colors.base03, fg = colors.cyan100, gui = 'bold' }
      }
    },
    lualine_z = {
      {
        -- 'location',
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
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

-- plugin gitsigns
require('gitsigns').setup {
  signs                        = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged                 = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable          = true,
  signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    follow_files = true
  },
  auto_attach                  = true,
  attach_to_untracked          = false,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,   -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

-- plugin telescope

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  }
})

telescope.load_extension("fzf")

local builtin = require('telescope.builtin')

bind("n", "<leader>ff", builtin.find_files, {})
-- bind("n", "<leader>fg", builtin.live_grep, {})
bind("n", "<leader>fc", function()
  builtin.grep_string({ search = vim.fn.input("GREP > ") })
end)
bind("n", "<leader>fb", builtin.buffers, {})
bind("n", "<leader>fh", builtin.help_tags, {})
bind("n", "<leader>fk", builtin.keymaps, {})
bind("n", "<leader>fr", builtin.lsp_references, {})
bind("n", "<leader>fb", builtin.loclist, {})
