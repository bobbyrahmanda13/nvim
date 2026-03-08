return {
  "mrcjkb/rustaceanvim",
  version = '^8', -- Recommended
  lazy = false,   -- This plugin is already lazy
  init = function()
 vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    -- on_attach = function(client, bufnr)
    --   -- you can also put keymaps in here
    -- end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        capabilites = capabilities,
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
          },
        },
        diagnostics = {
          messageDelay = 200,
          experimental = {
            enable = true
          },
        },
        checkOnSave = {
          enable = false,
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        cachePriming = {
          enable = false,
        },
      },
    },
  },
  -- DAP configuration
  dap = {
  },
} end,
}
