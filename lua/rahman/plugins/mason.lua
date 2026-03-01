return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "bashls",
      "rust_analyzer",
      "lua_ls",
      "ts_ls",
      "vue_ls",
      "vtsls",
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
    -- config = function()
    -- local mason_registry = require("mason-registry")
    -- local vue_language_server_path = vim.fn.stdpath('data') ..
    --     "/mason/packages/vue-language-server/node_modules/@vue/language-server"
    --
    -- local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
    -- local vue_plugin = {
    --   name = '@vue/typescript-plugin',
    --   location = vue_language_server_path,
    --   languages = { 'vue' },
    --   configNamespace = 'typescript',
    -- }
    --
    -- local vtsls_config = {
    --   settings = {
    --     vtsls = {
    --       tsserver = {
    --         globalPlugins = {
    --           vue_plugin,
    --         },
    --       },
    --     },
    --   },
    --   filetypes = tsserver_filetypes,
    -- }
    --
    -- local ts_ls_config = {
    --   init_options = {
    --     plugins = {
    --       vue_plugin,
    --     },
    --   },
    --   filetypes = tsserver_filetypes,
    -- }
    --
    -- -- If you are on most recent `nvim-lspconfig`
    -- local vue_ls_config = {}
    --
    -- vim.lsp.config('vtsls', vtsls_config)
    -- vim.lsp.config('vue_ls', vue_ls_config)
    -- vim.lsp.config('ts_ls', ts_ls_config)
    --
    -- vim.lsp.enable({ 'vtsls', 'vue_ls' }) -- If using `ts_ls` replace `vtsls` to `ts_ls`
    --
    -- end


  },
}
