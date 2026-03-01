return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "bashls",
      "rust_analyzer",
      "ts_ls",
      "lua_ls",
      "vue_ls",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          check_outdated_packages_on_open = true,
          border = "rounded",
          width = 0.8,
          height = 0.7,
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }
    },
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("nvim-lspconfig")

      local mason_registry = require("mason-registry")
      local vue_language_server = mason_registry.get_package("vue-language-server"):get_install_path "/home/rahman/.local/share/pnpm/global/5/node_modules/@vue/language-server"

      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      lspconfig.ts_ls.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server,
              language = { "vue" },
            }
          }
        }
      })
    end
  },
}
