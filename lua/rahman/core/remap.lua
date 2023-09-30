vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n","<leader>ex",":Ex<CR>")
-- general keymaps
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<C-s>", ":w<CR>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontaly
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab 
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("n", "<leader>h", "<C-w>h<CR>") 
keymap.set("n", "<leader>j", "<C-w>j<CR>") 
keymap.set("n", "<leader>k", "<C-w>k<CR>") 
keymap.set("n", "<leader>l", "<C-w>l<CR>") 

keymap.set("n", "<C-d>", "<C-d>zz<CR>") 
keymap.set("n", "<C-u>", "<C-u>zz<CR>") 
keymap.set("n", "n", "nzzzv") 
keymap.set("n", "N", "Nzzzv") 

keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
keymap.set("v", "K", ":m '<-2<CR>gv=gv") 
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set({"n", "v"}, "<leader>y", "\"+yap")
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({"n", "v"}, "<leader>d", [["_d]])

keymap.set("n","y1","yiw")
keymap.set("n","t2","viw")
keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- terminal nvim keymap
keymap.set({"t","i"}, "<A-n>", [[<C-\><C-n>]])
keymap.set({"t","i"}, "<A-h>", [[<C-\><C-n><C-w>h]])
keymap.set({"t","i"}, "<A-j>", [[<C-\><C-n><C-w>j]])
keymap.set({"t","i"}, "<A-k>", [[<C-\><C-n><C-w>k]])
keymap.set({"t","i"}, "<A-l>", [[<C-\><C-n><C-w>l]])

-- plugin keymaps
-- telescope 

local builtin = require('telescope.builtin')

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", function()
builtin.grep_string({search = vim.fn.input("GREP > ")})
end)
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help-tags<CR>")

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]


-- keymap autoclose
keymap.set("i", "(", "()<left>") 
keymap.set("i", "[", "[]<left>") 
keymap.set("i", "{", "{}<left>") 
keymap.set("i", "<", "<><left>") 
keymap.set("i", "'", "''<left>") 
keymap.set("i", '"', '""<left>') 
