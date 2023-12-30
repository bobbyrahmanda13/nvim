vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_altv = 1

-- Add netrw_gitignore#Hide for Lua files
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]] .. ',' .. vim.fn['netrw_gitignore#Hide']() .. ',\\.git$'

-- Set default netrw options
-- local netrwHide = [[\(^\|\s\s\)\zs\.\S\+]]
-- vim.g.netrw_list_hide = vim.fn['netrw_gitignore#Hide']() -- default setting

-- vim.g.netrw_browse_split = 0

local bind = vim.keymap.set
bind("n","<leader>ex",":Lexplore<CR>")
bind("n","<leader>xx",":Lexplore %:p:h<CR>")
