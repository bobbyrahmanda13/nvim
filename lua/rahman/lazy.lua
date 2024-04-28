local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local opts = {
  root = vim.fn.stdpath("data") .. "/lazy",
  install = {colorscheme = { "solarized-osaka" }},
  change_detection = {
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
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

require("lazy").setup({ { import = "rahman.plugins"},{import = "rahman.plugins.lsp"} }, opts )
