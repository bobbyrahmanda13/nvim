return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require 'nvim-treesitter'.setup {
      -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
      install_dir = vim.fn.stdpath('data') .. '/site',
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
    require 'nvim-treesitter'.install { 'rust', 'javascript', 'typescript', "vue", "go", "sql", "graphql", "html", "css", "bash", "python", "vim", "json", "toml", "yaml", "ssh_config", "markdown", "markdown_inline", "gomod", "gosum", "gotmpl", "c" }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function() vim.treesitter.start() end,
    })
  end
}
