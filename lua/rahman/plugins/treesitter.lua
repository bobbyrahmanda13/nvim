return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.config').setup {
      ensure_installed = { "javascript", "typescript", "html", "css", "python", "bash", "markdown", "markdown_inline", "lua", "sql", "regex", "json", "scss", "zig", "vue", "go", "templ", "rust", "prisma", "graphql", "gitignore", "c", "yaml", "toml", "helm", "gotmpl" },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function() vim.treesitter.start() end,
    })
  end
}
