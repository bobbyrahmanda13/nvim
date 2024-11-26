return {
  "mrcjkb/rustaceanvim",
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    -- Configure rustaceanvim here
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ['rust-analyzer'] = {

            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true
            },

          },
        },
      },
    }
  end,
}
