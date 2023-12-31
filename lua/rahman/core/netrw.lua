vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_chgwin = -1
-- vim.g.netrw_browse_split = 0

-- Set default netrw options
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

-- Add netrw_gitignore#Hide for Lua files
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ',' .. vim.fn['netrw_gitignore#Hide']() .. ',\\.git$'

-- ! Note => jika pas awal buka folder nya gk ada berarti itu ke hidden caranya ya gunakan keymap "gh" untuk memunculkan file and folder nya

-- vim.g.netrw_list_hide = vim.fn['netrw_gitignore#Hide']() -- default setting


local bind = vim.keymap.set
bind("n","<leader>ex",":cd %:p:h<CR>:Lexplore<CR>")

-- bind("n","<leader>ex",":Lexplore<CR>")
-- bind("n","<leader>xx",":Lexplore %:p:h<CR>")
