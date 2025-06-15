return {
  'saecki/crates.nvim',
  tag = 'stable',
  config = function()
    require('crates').setup {
      lsp = {
        enabled = true,
        on_attach = function(client, bufnr)
        end,
        actions = true,
        completion = {
          cmp = {
            enabled = true,
          },
        },
        hover = true,
      }
    }
  end,
}
