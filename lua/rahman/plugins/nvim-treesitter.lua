return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = { enable = true, mode = "topline", line_numbers = true }
    },
  },
  config = function()
    require('nvim-treesitter').setup {
      ensure_installed = {
        'rust', 'comment', 'gowork', 'javascript', 'typescript', "vue", "go", "sql", "graphql", "html", "css", "bash", "python", "vim", "json", "toml", "yaml", "ssh_config", "markdown", "markdown_inline", "gomod", "gosum", "gotmpl", "c", "csv" },

      auto_install = true,
      sync_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
    -- vim.api.nvim_create_autocmd('FileType', {
    --   pattern = { '<filetype>' },
    --   callback = function() vim.treesitter.start() end,
    -- })
  end
}
