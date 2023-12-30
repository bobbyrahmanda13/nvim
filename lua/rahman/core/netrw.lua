vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
-- vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1

local bind = vim.keymap.set
bind("n","<leader>ex",":Lexplore<CR>")
bind("n","<leader>xx",":Lexplore %:p:h<CR>")

-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
-- vim.g.netrw_winsize = 25
--
-- vim.api.nvim_exec([[
--   augroup ProjectDrawer
--     autocmd!
--     autocmd VimEnter * :Vexplore
--   augroup END
-- ]], false)
