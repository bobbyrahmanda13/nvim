vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30

vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

local bind = vim.keymap.set
bind("n","<leader>ex",":Lexplore<CR>")
bind("n","<leader>xx",":Lexplore %:p:h<CR>")

