local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
  -- pickers = {
  --   cwd = vim.fn.expand('%:p:h')
  --   find_files = {
  --     find_command = {"rg", "--files", "--hidden", "--ignore", "-u", "--glob=!**/.git/*", "--glob=!**/node_modules/*", "--glob=!**/.next/*"},    
  --   }
  -- },
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			}
		}
	}

})
