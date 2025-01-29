return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",

  config = function()

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local util = require('lspconfig.util')

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local bind = vim.keymap.set

    -- local borderLsp = "rounded"
    local borderLsp = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }

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


    vim.cmd([[highlight DiagnosticSignError gui=bold guifg=#dc312e ]])
    vim.cmd([[highlight DiagnosticSignWarn gui=bold guifg=#b38600 ]])
    vim.cmd([[highlight DiagnosticHintLn gui=bold guifg=#2aa298 ]])
    vim.cmd([[highlight DiagnosticInfoLn gui=bold guifg=#859900 ]])
    
    -- 
    -- local signsIcon = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end

    vim.diagnostic.config({
      float = { border = borderLsp },
      virtual_text = { prefix = '●'}, --default true
      -- underline = true,
      severity_sort = true,
      signs = {
        text = {
          -- [vim.diagnostic.severity.ERROR] = signsIcon.Error,
          -- [vim.diagnostic.severity.WARN] = signsIcon.Warn,
          -- [vim.diagnostic.severity.HINT] = signsIcon.Hint,
          -- [vim.diagnostic.severity.INFO] = signsIcon.Info,
          -- [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.HINT] = '󰌵 ',
          [vim.diagnostic.severity.INFO] = ' ',
        },
        linehl = {
          -- [vim.diagnostic.severity.ERROR] = 'DiagnosticUnderlineError',
          -- [vim.diagnostic.severity.WARN] = 'WarningMsg',
          -- [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
          -- [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
          [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        },
      }
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('rahman-lsp-config', { clear = true }),
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
        -- bind('n', '<leader>hf', function()
        --   vim.lsp.buf.format({ async = true})
        -- end, opts)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre',{
              buffer = ev.buf,
              callback = function ()
                vim.lsp.buf.format({bufnr = ev.buf, id = client.id})
              end
            })
          end


      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()


    local mason_registry = require('mason-registry')
    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'


    mason_lspconfig.setup_handlers({

      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      ["gopls"] = function()

        lspconfig["gopls"].setup({

          capabilities = capabilities,
          filetype = {'go', 'gomod', 'gowork', 'gotmpl'},

        })

      end,

      ["bashls"] = function()

        lspconfig["bashls"].setup({

          capabilities = capabilities,

        })

      end,

        -- ["templ"] = function()
        --
        --   lspconfig["templ"].setup({
        --
        --     capabilities = capabilities,
        --     filetype = {'html','templ'},
        --
        --   })
        --
        -- end,

        ["rust_analyzer"] = function() end,

        ["ts_ls"] = function()

          lspconfig["ts_ls"].setup({

            capabilities = capabilities,
            root_dir = util.root_pattern('tsconfig.json', 'package.json', 'nuxt.config.ts', 'uno.config.ts', '.git'),
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_language_server_path,
                  languages = {'vue'}
                },
              }
            },
          })

        end,

      ["volar"] = function()

        local volar_typescript = mason_registry.get_package('typescript-language-server'):get_install_path() .. '/node_modules/typescript/lib'

        lspconfig["volar"].setup({
          capabilities = capabilities,
          root_dir = util.root_pattern("package.json","vue.config.ts","nuxt.config.ts","uno.config.ts"),
          init_options = {
            vue = {
              hybridMode = false,
            },
            typescript = {
              tsdk = volar_typescript,
            },
          },
        })

      end

    })

  end
}
}
