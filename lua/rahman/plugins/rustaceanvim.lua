return {
  "mrcjkb/rustaceanvim",
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    -- Configure rustaceanvim here
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)

          local bufnr = vim.api.nvim_get_current_buf()
          vim.keymap.set(
            "n", 
            "<leader>a", 
            function()
              vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
              -- or vim.lsp.buf.codeAction() if you don't want grouping.
            end,
            { silent = true, buffer = bufnr }
          )
          vim.keymap.set(
            "n", 
            "J",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
            function()
              vim.cmd.RustLsp({'hover', 'actions'})
            end,
            { silent = true, buffer = bufnr }
          )

        end,

        default_settings = {
          ['rust-analyzer'] = {

            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            typing = {
              autoClosingAngleBrackets = {
                enable = true,
              },
            },
            inlayHints = {
              typeHints = true,
            },
            diagnostics = {
              styleLints = {
                enable = true,
              }
            }

          },
        },
      },
    }
  end,
}
