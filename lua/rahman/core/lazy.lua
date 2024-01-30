local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = { 
  -- { 
  --   "catppuccin/nvim", 
  --   name = "catppuccin", 
  --   priority = 1000, 
  --   lazy = true,
  --   --		config = function()
  --   --			vim.cmd.colorscheme("catppuccin")
  --   --		end
  -- },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
  },

  -- auto completions
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},

  -- configuring lsp servers
  {"neovim/nvim-lspconfig"},
  {"hrsh7th/cmp-nvim-lsp"},

  -- snippets
  {"L3MON4D3/LuaSnip"},
  {"saadparwaiz1/cmp_luasnip"},
  {"rafamadriz/friendly-snippets"},
  {"nvim-lualine/lualine.nvim"},
  {"numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  },
  {"ThePrimeagen/harpoon", branch = "harpoon2"},
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {"nvim-tree/nvim-tree.lua", version = "*", lazy = false},
  {"nvim-tree/nvim-web-devicons"}
}

local opts = {
  root = vim.fn.stdpath("data") .. "/lazy",
  install = {colorscheme = { "solarized-osaka" }},
  ui = {
    border = "rounded",
    icons = {
      config = "",
      ft = " ",
      init = " ",
      keys = " ",
      loaded = "●",
      not_loaded = "○",
      start = "⚙️",
      source = " ",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    }
  }
}
require("lazy").setup(plugins, opts)
