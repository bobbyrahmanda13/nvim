return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = {"smart"},
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })

    telescope.load_extension("fzf")


    local builtin = require('telescope.builtin')

    local bind = vim.keymap.set

    bind("n", "<leader>ff", builtin.find_files, {})
    bind("n", "<leader>fg", builtin.live_grep, {})
    bind("n", "<leader>fc", function()
      builtin.grep_string({search = vim.fn.input("GREP > ")})
    end)
    bind("n", "<leader>fb", builtin.buffers, {})
    bind("n", "<leader>fh", builtin.help_tags, {})
    bind("n", "<leader>fk", builtin.keymaps, {})
    bind("n", "<leader>fr", builtin.lsp_references, {})
    bind("n", "<leader>fb", builtin.loclist, {})

    -- telescope git commands (not on youtube nvim video)
    bind("n", "<leader>gc", "<cmd>telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
    bind("n", "<leader>gfc", "<cmd>telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
    bind("n", "<leader>gb", "<cmd>telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
    bind("n", "<leader>gs", "<cmd>telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
    
  end
}
