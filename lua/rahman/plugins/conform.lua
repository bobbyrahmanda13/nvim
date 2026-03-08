return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports" }
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 1000 },
      -- Customize formatters
      formatters = {
        shfmt = {
          append_args = { "-i", "2" },
        },
      },
    })
  end,
}
