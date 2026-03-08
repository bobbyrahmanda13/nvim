return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = vim.lsp.config
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))
      capabilities = vim.tbl_deep_extend('force', capabilities, {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }
        }
      })

      local luals_config = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "empty" },
            }
          }
        }
      }
      lspconfig("lua_ls", luals_config)

      -- config vue_ls, vtsls, ts_ls
      local vue_language_server_path = vim.fn.stdpath('data') ..
          "/home/rahman/.local/share/pnpm/global/5/node_modules/@vue/language-server"

      local tsserver_filetypes       = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
      local vue_plugin               = {
        capabilities = capabilities,
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }

      local vtsls_config             = {
        capabilities = capabilities,
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = tsserver_filetypes,
      }

      local ts_ls_config             = {
        capabilities = capabilities,
        init_options = {
          plugins = {
            vue_plugin,
          },
        },
        filetypes = tsserver_filetypes,
      }

      local vue_ls_config            = {
        capabilities = capabilities,
      }

      local gopls_config             = {
        capabilities = capabilities
      }

      lspconfig('vtsls', vtsls_config)
      lspconfig('vue_ls', vue_ls_config)
      lspconfig('ts_ls', ts_ls_config)
      lspconfig('gopls', gopls_config)


      vim.lsp.enable({ "lua_ls", "gopls", "vue_ls", "vtsls", "ts_ls" })

      -- configuration diagnostic

      vim.cmd([[highlight DiagnosticSignError gui=bold guifg=#dc312e ]])
      vim.cmd([[highlight DiagnosticSignWarn gui=bold guifg=#b38600 ]])
      vim.cmd([[highlight DiagnosticHintLn gui=bold guifg=#2aa298 ]])
      vim.cmd([[highlight DiagnosticInfoLn gui=bold guifg=#859900 ]])


      local severity = vim.diagnostic.severity

      vim.diagnostic.config({
        underline = true,
        virtual_lines = {
          current_line = true,
          format = function(diagnostic)
            local message = diagnostic.message
            local win_width = vim.api.nvim_win_get_width(0)
            local max_width = math.floor(win_width * 3 / 4)

            if #message <= max_width then
              return message
            end

            -- wrap if length message is greather than max_width
            local wrapped = {}
            for i = 1, #message, max_width do
              table.insert(wrapped, message:sub(i, i + max_width - 1))
            end

            return table.concat(wrapped, "\n")
          end,
        },
        -- signs = true,
        signs = {
          text = {
            -- [vim.diagnostic.severity.ERROR] = signsIcon.Error,
            -- [vim.diagnostic.severity.WARN] = signsIcon.Warn,
            -- [vim.diagnostic.severity.HINT] = signsIcon.Hint,
            -- [vim.diagnostic.severity.INFO] = signsIcon.Info,
            -- [vim.diagnostic.severity.ERROR] = ' ',
            [severity.ERROR] = ' ',
            [severity.WARN] = ' ',
            [severity.HINT] = '󰌵 ',
            [severity.INFO] = ' ',
          },
        }
      })
    end,
  }
}
