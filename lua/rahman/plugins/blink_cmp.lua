return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "none",
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<CR>"] = { "select_and_accept", "fallback" },
          ["<C-space>"] = {
            function(cmp)
              cmp.show({ providers = { "lsp", "path", "buffer" } })
            end,
          },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
          providers = {
            emoji = {
              module = "blink-emoji",
              name = "Emoji",
              score_offset = 15,
              opts = {
                insert = true,
                ---@type string|table|fun():table
                trigger = function()
                  return { ":" }
                end,
              },
              should_show_items = function()
                return vim.tbl_contains({ "gitcommit", "markdown", "html" }, vim.o.filetype)
              end,
            },
          },
        },

        cmdline = {
          enabled = false,
        },

        term = {
          enabled = false,
        },
        completion = {
          ghost_text = {
            show_with_menu = true,
            enabled = true,
          },
          trigger = {
            show_on_accept_on_trigger_character = true,
            show_on_blocked_trigger_characters = { ' ', '\n', '\t' },
          },
          accept = {
            create_undo_point = false,
            auto_brackets = {
              enabled = false,
            },
          },

          list = {
            selection = { preselect = true, auto_insert = false },
          },

          menu = {
            auto_show = true,
            draw = {
              treesitter = { "lsp" },
              columns = {
                { "kind_icon" },
                { "label", },
                { "label_description", gap = 1 },
                { "source_name",       gap = 1 },
              },
              components = {
                label = {
                  width = { fill = true, max = 60 },
                  text = function(ctx) return ctx.label .. ctx.label_detail end,
                  highlight = function(ctx)
                    -- label and label details
                    local highlights = {
                      { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
                    }
                    if ctx.label_detail then
                      table.insert(highlights,
                        { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                    end

                    -- characters matched on the label by the fuzzy matcher
                    for _, idx in ipairs(ctx.label_matched_indices) do
                      table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                    end

                    return highlights
                  end,
                },

                label_description = {
                  width = { max = 30 },
                  text = function(ctx) return ctx.label_description end,
                  highlight = 'BlinkCmpLabelDescription',
                },

                source_name = {
                  width = { max = 30 },
                  text = function(ctx) return ctx.source_name end,
                  highlight = 'BlinkCmpSource',
                },

                source_id = {
                  width = { max = 30 },
                  text = function(ctx) return ctx.source_id end,
                  highlight = 'BlinkCmpSource',
                },
              },
            },
          },

          documentation = {
            auto_show = true,
            auto_show_delay_ms = 300,
            window = {
              border = "single",
            },
          },
        },
      })
    end
  } }
