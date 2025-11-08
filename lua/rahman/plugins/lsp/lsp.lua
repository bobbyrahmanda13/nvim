return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  -- dependencies = {},
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {

      capabilities = capabilities,
    })
  end,
}
