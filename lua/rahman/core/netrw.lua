-- vim.g.netrw_keepdir = 1
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_cursor = 1
vim.g.netrw_keepj = ""
vim.g.netrw_cygwin = 0
-- vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
-- vim.g.netrw_preview = 1

-- Set default netrw options
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

-- Add netrw_gitignore#Hide for Lua files
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ',' .. vim.fn['netrw_gitignore#Hide']() .. ',\\.git$'

-- ! Note => jika pas awal buka folder nya gk ada berarti itu ke hidden caranya ya gunakan keymap "gh" untuk memunculkan file and folder nya

-- vim.g.netrw_list_hide = vim.fn['netrw_gitignore#Hide']() -- default setting


local bind = vim.keymap.set
-- bind("n","<leader>ex",":cd %:p:h<CR>:Lexplore<CR>")

bind("n","<leader>ex",":Lexplore<CR>")
bind("n","<leader>ec",":Lexplore %:p:h<CR>")
