return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local util = require('lspconfig.util')

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local bind = vim.keymap.set

    local borderLsp = "rounded"
    -- local borderLsp = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = borderLsp
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = borderLsp
      }
    )
    local ui_lsp = require('lspconfig.ui.windows')
    ui_lsp.default_options.border = borderLsp


    -- vim.cmd([[highlight ErrorMsg guibg=#3d0000 ]])
    -- vim.cmd([[highlight WarningMsg guibg=#513A1A ]])
    -- vim.cmd([[highlight DiagnosticHintLn guibg=#024649 ]])
    -- vim.cmd([[highlight DiagnosticInfoLn guibg=#024649 ]])

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- vim.diagnostic.config({
    --   float = { border = borderLsp },
    --   -- virtual_text = true, --default true
    --   -- underline = true,
    --   -- severity_sort = true,
    --   signs = {
    --     text = {
    --       [vim.diagnostic.severity.ERROR] = signsIcon.ERROR,
    --       [vim.diagnostic.severity.WARN] = signsIcon.WARN,
    --       [vim.diagnostic.severity.INFO] = signsIcon.INFO,
    --       [vim.diagnostic.severity.HINT] = signsIcon.HINT,
    --     },
    --     --   linehl = {
    --     --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    --     --     [vim.diagnostic.severity.WARN] = 'WarningMsg',
    --     --     [vim.diagnostic.severity.INFO] = 'DiagnosticInfoLn',
    --     --     [vim.diagnostic.severity.HINT] = 'DiagnosticHintLn',
    --     --   },
    --     numhl = {
    --       [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    --       [vim.diagnostic.severity.WARN] = 'WarningMsg',
    --       [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
    --       [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
    --     },
    --   }
    -- })
    --
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }
        bind('n', 'gdc', vim.lsp.buf.declaration, opts)
        bind('n', 'gdf', vim.lsp.buf.definition, opts)
        bind('n', 'K', vim.lsp.buf.hover, opts)
        bind('n', '<leader>vd', vim.diagnostic.open_float, opts)
        bind('n', '[d', vim.diagnostic.goto_next, opts)
        bind('n', ']d', vim.diagnostic.goto_prev, opts)
        bind('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        bind('n', '<leader>vrr', vim.lsp.buf.references, opts)
        -- bind('n', '<leader>vrr', "<cmd>Telescope lsp_references<CR>", opts)
        bind('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        bind('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        bind('n', '<leader>hf', function()
          vim.lsp.buf.format({ async = true})
        end, opts)
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local vue_ts_plugin = '/home/rahman/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin'

    mason_lspconfig.setup_handlers({

      function(server_name)
        lspconfig[server_name].setup({
          capabilities =capabilities,
        })
      end,
      ["gopls"] = function()

        lspconfig["gopls"].setup({
          capabilities = capabilities,
          filetype = {'go', 'gomod', 'gowork', 'gotmpl'},
        })

      end,
      ["tsserver"] = function()

        lspconfig["tsserver"].setup({
          -- on_attach = on_attach,
          capabilities = capabilities,
          root_dir = util.root_pattern('tsconfig.json', 'package.json', 'nuxt.config.ts', 'uno.config.ts', '.git'),
          init_options = {
            hostInfo = "neovim",
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_ts_plugin,
                languages = {"vue"}
              },
            },
          },
          filetypes = {
            "javascript",
            "typescript",
            "vue",
          },
        })

      end,
      ["volar"] = function()

        local tslib_path='/home/rahman/.local/share/pnpm/global/5/node_modules/typescript/lib/'
        local volar_init_options = {
          typescript = {
            tsdk = tslib_path,
          },
        }

        lspconfig["volar"].setup({
          -- on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { 'vue' },
          root_dir = util.root_pattern 'package.json',
          init_options = volar_init_options,
        })

      end

    })

  end
}
