return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require 'nvim-treesitter'.install { "javascript", "typescript", "html", "css", "python", "bash", "markdown", "markdown_inline", "lua", "sql", "regex", "json", "scss", "zig", "vue", "go", "templ", "rust", "prisma", "graphql", "gitignore", "c", "yaml", "toml", "helm", "gotmpl" }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function() vim.treesitter.start() end,
    })
  end
}
