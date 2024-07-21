vim.g.mapleader = " "

local bind = vim.keymap.set

-- general keymaps
bind("i", "jk", "<Esc>")

bind("n", "<leader>nh", ":nohl<CR>")
bind("n", "<C-s>", ":w<CR>")

bind("n", "<leader>sv", "<C-w>v") -- split window vertically
bind("n", "<leader>sh", "<C-w>s") -- split window horizontaly
bind("n", "<leader>se", "<C-w>=") -- make split windows equal width
bind("n", "<leader>sx", ":close<CR>") -- close current split window

bind("n", "rv", ":vertical resize +5<CR>") 
bind("n", "rvv", ":vertical resize -5<CR>") 
bind("n", "rh", ":horizontal resize +5<CR>") 
bind("n", "rhh", ":horizontal resize -5<CR>") 

bind("n", "<leader>to", ":tabnew<CR>") -- open new tab 
bind("n", "<leader>tx", ":tabclose<CR>") -- close current tab
bind("n", "<leader>tn", ":tabn<CR>") -- go to next tab
bind("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

bind("n", "<leader>h", "<C-w>h<CR>") 
bind("n", "<leader>j", "<C-w>j<CR>") 
bind("n", "<leader>k", "<C-w>k<CR>") 
bind("n", "<leader>l", "<C-w>l<CR>") 

bind("n", "J", "mzJ`z")
bind("n", "Q", "<nop>")

bind("n", "<C-d>", "<C-d>zz<CR>") 
bind("n", "<C-u>", "<C-u>zz<CR>") 
bind("n", "n", "nzzzv") 
bind("n", "N", "Nzzzv") 

bind("v", "J", ":m '>+1<CR>gv=gv") 
bind("v", "K", ":m '<-2<CR>gv=gv") 
bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

bind({"n", "v"}, "<leader>y", "\"+yap")
bind("n", "<leader>Y", [["+Y]])

bind({"n", "v"}, "<leader>d", [["_d]])

bind("n","y1","yiw")
bind("n","t2","viwxi")
bind("x", "<leader>p", "\"_dP")


bind("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- terminal nvim vim.keymap
bind("t", "<A-n>", [[<C-\><C-n>]])
bind("t", "<A-h>", [[<C-\><C-n><C-w>h]])
bind("t", "<A-j>", [[<C-\><C-n><C-w>j]])
bind("t", "<A-k>", [[<C-\><C-n><C-w>k]])
bind("t", "<A-l>", [[<C-\><C-n><C-w>l]])

bind("n","<leader>gf",[[ggVG=]])

-- vim.keymap autoclose
bind("i", "(", "()<left>") 
bind("i", "[", "[]<left>") 
bind("i", "{", "{}<left>") 
bind("i", "<", "<><left>") 
bind("i", "'", "''<left>") 
bind("i", '"', '""<left>') 
