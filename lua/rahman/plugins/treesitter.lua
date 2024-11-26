return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()

    local configs = require("nvim-treesitter.configs")
    configs.setup({

      ensure_installed = { "javascript","typescript","html","css","python","bash","markdown","markdown_inline","lua","sql","regex","json","scss","zig","vue","go","templ","rust","prisma","graphql","gitignore","c","yaml","toml"},

      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      -- autotag = { enable = true },
      highlight = { enable = true },
    })
  end
}
